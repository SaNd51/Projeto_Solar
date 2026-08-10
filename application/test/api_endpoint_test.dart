import 'package:flutter_test/flutter_test.dart';
import 'package:solar_app/services/api_service.dart';

void main() {
  group('ApiEndpoint.resolve', () {
    test('usa o host da máquina no emulador Android', () {
      expect(
        ApiEndpoint.resolve(isWeb: false, isAndroid: true, configuredUrl: ''),
        'http://10.0.2.2:5076/api',
      );
    });

    test('mantém localhost em desktop e web', () {
      expect(
        ApiEndpoint.resolve(isWeb: false, isAndroid: false, configuredUrl: ''),
        'http://localhost:5076/api',
      );
      expect(
        ApiEndpoint.resolve(isWeb: true, isAndroid: true, configuredUrl: ''),
        'http://localhost:5076/api',
      );
    });

    test('prioriza API_BASE_URL para dispositivos físicos', () {
      expect(
        ApiEndpoint.resolve(
          isWeb: false,
          isAndroid: true,
          configuredUrl: 'http://192.168.0.25:5076/api/',
        ),
        'http://192.168.0.25:5076/api',
      );
    });
  });
}
