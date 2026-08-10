import 'dart:convert';

import 'api_service.dart';

class AuthService {
  static Future<Map<String, dynamic>> create({
    required String user,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post('/clientes', {
        'nome': user,
        'email': email,
        'password': password,
      });

      return {'success': true, 'data': response};
    } on ApiException catch (error) {
      if (error.statusCode == 409) {
        return {
          'success': false,
          'message': 'Este e-mail já está cadastrado. Tente outro.',
        };
      }

      if (error.statusCode == 400 || error.statusCode == 422) {
        return {
          'success': false,
          'message': _messageFromApi(error.responseBody),
        };
      }

      return {
        'success': false,
        'message': 'A API retornou o erro ${error.statusCode}.',
      };
    } catch (error) {
      return {
        'success': false,
        'message': 'Não foi possível conectar à API: $error',
      };
    }
  }

  static String _messageFromApi(String responseBody) {
    try {
      final response = jsonDecode(responseBody);
      if (response is Map<String, dynamic>) {
        if (response['detail'] is String) {
          return response['detail'] as String;
        }

        final errors = response['errors'];
        if (errors is Map) {
          final messages = errors.values
              .whereType<List>()
              .expand((value) => value)
              .whereType<String>()
              .toList();

          if (messages.isNotEmpty) {
            return messages.join('\n');
          }
        }
      }
    } catch (_) {
      // Falls back to the generic validation message below.
    }

    return 'Verifique os dados informados e tente novamente.';
  }
}
