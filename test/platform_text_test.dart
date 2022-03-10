import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_text/platform_text.dart';

void main() {
  group('Smoke tests', () {
    test('Check PlatformText data value', () {
      // given
      const String value = 'text_value';

      // when
      PlatformText platformText = const PlatformText(value);

      // then
      expect(platformText.data, value);
    });

    testWidgets('Check build method', (WidgetTester tester) async {
      // given
      const String value = 'text_value';
      PlatformText platformText = const PlatformText(value);

      // when
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: platformText,
        ),
      );

      // then
      expect(find.widgetWithText(PlatformText, value), findsOneWidget);
    });

    test('Check widget assertion error while minLines = 0', () {
      // given / when / then
      expect(() {
        PlatformText('data', minLines: 0);
      }, throwsAssertionError);
    });

    test('Check widget assertion error while maxLines = 0', () {
      // given / when / then
      expect(() {
        PlatformText('data', maxLines: 0);
      }, throwsAssertionError);
    });

    test('Check widget assertion error while minLines > maxLines', () {
      // given / when / then
      expect(() {
        PlatformText('data', minLines: 2, maxLines: 1);
      }, throwsAssertionError);
    });
  });
}
