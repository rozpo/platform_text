import 'package:flutter_test/flutter_test.dart';
import 'package:platform_text/platform_text.dart';

void main() {
  test('Check PlatformText data value', () {
   const PlatformText platformText = PlatformText('test_value');

   expect(platformText.data, 'test_value');
  });
}
