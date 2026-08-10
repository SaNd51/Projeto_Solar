import 'api_service.dart';

class ClientService {
  static Future<List<dynamic>> listarClientes() async {
    return ApiService.getList('/clientes');
  }
}
