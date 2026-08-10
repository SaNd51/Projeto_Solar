import 'dart:convert';

import 'package:solar_app/services/api_service.dart';

class TechnicianService {
static Future<Map<String, dynamic>> addTechnician({
required String name,
required String role,
required String email,
required String password,
}) async {
try {
final response = await ApiService.post('/tecnicos', {
'nome': name,
'cargo': role,
'email': email,
'password': password,
});
  return {
    'success': true,
    'data': response,
  };
} on ApiException catch (error) {
  if (error.statusCode == 409) {
    return {
      'success': false,
      'message': 'Este e-mail já está cadastrado.',
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
    'message': 'Erro da API: ${error.statusCode}',
  };
} catch (error) {
  return {
    'success': false,
    'message': 'Erro de conexão: $error',
  };
}


}

static String _messageFromApi(String responseBody) {
try {
final response = jsonDecode(responseBody);


  if (response is Map<String, dynamic>) {
    if (response['detail'] is String) {
      return response['detail'];
    }

    if (response['errors'] is Map) {
      final messages = (response['errors'] as Map)
          .values
          .whereType<List>()
          .expand((e) => e)
          .whereType<String>()
          .toList();

      if (messages.isNotEmpty) {
        return messages.join('\n');
      }
    }
  }
} catch (_) {}

return 'Verifique os dados informados.';


}
}
