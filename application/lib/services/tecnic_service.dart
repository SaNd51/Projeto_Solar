import 'api_service.dart';

class TecnicService {
  static Future<List<dynamic>> listarTecnicos() async {
    return ApiService.getList('/tecnicos');
  }
}
