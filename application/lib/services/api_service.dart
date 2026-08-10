import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'platform_detector.dart';

class ApiException implements Exception {
  const ApiException({
    required this.endpoint,
    required this.statusCode,
    required this.responseBody,
  });

  final String endpoint;
  final int statusCode;
  final String responseBody;

  @override
  String toString() => 'Erro ao chamar $endpoint: $statusCode $responseBody';
}

/// Defines the API address for the current runtime environment.
///
/// An Android emulator reaches services running on the host machine through
/// 10.0.2.2; its own localhost is not the development machine's localhost.
class ApiEndpoint {
  static const _defaultBaseUrl = 'http://localhost:5076/api';
  static const _androidEmulatorBaseUrl = 'http://10.0.2.2:5076/api';
  static const configuredBaseUrl = String.fromEnvironment('API_BASE_URL');

  static String resolve({
    required bool isWeb,
    required bool isAndroid,
    String configuredUrl = configuredBaseUrl,
  }) {
    if (configuredUrl.isNotEmpty) {
      return configuredUrl.replaceFirst(RegExp(r'/+$'), '');
    }

    if (!isWeb && isAndroid) {
      return _androidEmulatorBaseUrl;
    }

    return _defaultBaseUrl;
  }
}

class ApiService {
  static String get baseUrl =>
      ApiEndpoint.resolve(isWeb: kIsWeb, isAndroid: isAndroidRuntime);

  static Future<List<dynamic>> getList(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as List<dynamic>;
    }

    throw ApiException(
      endpoint: endpoint,
      statusCode: response.statusCode,
      responseBody: response.body,
    );
  }

  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {};
      }

      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    throw ApiException(
      endpoint: endpoint,
      statusCode: response.statusCode,
      responseBody: response.body,
    );
  }
}
