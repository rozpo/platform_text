import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_text/platform_text.dart';

void main() {
  group('PlatformText()', () {
    test('Check PlatformText data value', () {
      // given
      const String value = 'text_value';

      // when
      PlatformText platformText = const PlatformText(value);

      // then
      expect(platformText.data, value);
    });

    testWidgets('Check build method for native', (WidgetTester tester) async {
      // given
      const String value = 'text_value';
      PlatformText platformText = const PlatformText(
        value,
        webTest: false,
      );

      // when
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: platformText,
        ),
      );

      // then
      expect(find.widgetWithText(PlatformText, value), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('Check build method for web', (WidgetTester tester) async {
      // given
      const String value = 'text_value';
      PlatformText platformText = const PlatformText(
        value,
        webTest: true,
      );

      // when
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: platformText,
          ),
        ),
      );

      // then
      expect(find.widgetWithText(PlatformText, value), findsOneWidget);
      expect(find.byType(SelectableText), findsOneWidget);
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

  group('PlatformText.rich()', () {
    testWidgets('Check build method for native', (WidgetTester tester) async {
      // given
      const String value1 = 'text_value1';
      const String value2 = 'text_value2';
      const String value3 = 'text_value3';
      PlatformText platformText = const PlatformText.rich(
        TextSpan(
          text: value1,
          children: <TextSpan>[
            TextSpan(
              text: value2,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: value3,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        webTest: false,
      );

      // when
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: platformText,
        ),
      );

      // then
      expect(find.widgetWithText(PlatformText, '$value1$value2$value3'),
          findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('Check build method for web', (WidgetTester tester) async {
      // given
      const String value1 = 'text_value1';
      const String value2 = 'text_value2';
      const String value3 = 'text_value3';
      PlatformText platformText = const PlatformText.rich(
        TextSpan(
          text: value1,
          children: <TextSpan>[
            TextSpan(
              text: value2,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: value3,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        webTest: true,
      );

      // when
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: platformText,
          ),
        ),
      );

      // then
      expect(find.widgetWithText(PlatformText, '$value1$value2$value3'),
          findsOneWidget);
      expect(find.byType(SelectableText), findsOneWidget);
    });

    test('Check widget assertion error while minLines = 0', () {
      // given / when / then
      expect(() {
        PlatformText.rich(const TextSpan(), minLines: 0);
      }, throwsAssertionError);
    });

    test('Check widget assertion error while maxLines = 0', () {
      // given / when / then
      expect(() {
        PlatformText.rich(const TextSpan(), maxLines: 0);
      }, throwsAssertionError);
    });

    test('Check widget assertion error while minLines > maxLines', () {
      // given / when / then
      expect(() {
        PlatformText.rich(const TextSpan(), minLines: 2, maxLines: 1);
      }, throwsAssertionError);
    });
  });
}
