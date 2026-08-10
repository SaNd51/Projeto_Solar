import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/technician_service.dart';

void main(){
  test('teste de chamada à API e impressão no console', () async {
    try {
      final result = await TechnicianService.addTechnician(
        name: 'João Silva',
        role: 'Técnico',
        email: 'joao@email.com',
        password: '1234',
    );
      if (result['success']) {
        print('Técnico cadastrado com sucesso!');
      } else {
        print(result['message']);
      }
      } catch (e) {
         print('ERRO AO CHAMAR A API: $e');
        }
  }); 
}