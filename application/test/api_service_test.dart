import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/api_service.dart';

void main() {
  test('deve chamar a API local e exibir o resultado no console', () async {
    try {
      final email =
          'teste.${DateTime.now().microsecondsSinceEpoch}@console.com';
      final result = await ApiService.post('/clientes', {
        'nome': 'Teste Console',
        'email': email,
        'password': '123456',
      });

      print('RESULTADO DA API: $result');
    } catch (e) {
      print('ERRO DA API: $e');
      fail('Falha ao chamar a API local: $e');
    }
  });
}
