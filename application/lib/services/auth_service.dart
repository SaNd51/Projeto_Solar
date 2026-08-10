import 'api_service.dart';

class AuthService {
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post('/auth/login', {
        'email': email,
        'password': password,
      });

      return {
        'success': response['success'] == true,
        'message':
            response['message']?.toString() ?? 'Login realizado com sucesso.',
        'tipoAcesso': response['tipoAcesso']?.toString(),
      };
    } catch (e) {
      return {'success': false, 'message': 'E-mail ou senha inválidos.'};
    }
  }
}
