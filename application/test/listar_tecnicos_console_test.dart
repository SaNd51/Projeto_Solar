import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/tecnic_service.dart';

void main() {
  test('lista tecnicos da API e imprime no console', () async {
    try {
      final tecnicos = await TecnicService.listarTecnicos();
      print('LISTA DE TECNICOS: $tecnicos');
    } catch (e) {
      print('ERRO AO LISTAR tecnicos: $e');
      fail('Falha ao listar tecnicos: $e');
    }
  });
}
