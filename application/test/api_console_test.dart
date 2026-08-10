import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/api_service.dart';

void main() {
  test('teste de chamada à API e impressão no console', () async {
    try {
      final clientes = await ApiService.getList('/clientes');
      print('CLIENTES DA API: $clientes');
    } catch (e) {
      print('ERRO AO CHAMAR A API: $e');
      fail('Falha ao chamar a API: $e');
    }
  });
}
