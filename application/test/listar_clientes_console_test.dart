import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/client_service.dart';

void main() {
  test('lista clientes da API e imprime no console', () async {
    try {
      final clientes = await ClientService.listarClientes();
      print('LISTA DE CLIENTES: $clientes');
    } catch (e) {
      print('ERRO AO LISTAR CLIENTES: $e');
      fail('Falha ao listar clientes: $e');
    }
  });
}
