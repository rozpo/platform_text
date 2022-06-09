<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## PlatformText

A Flutter package to make your text selectable for web and non-selectable for native builds.

[![pipeline status](https://gitlab.com/rozpo.dev/platform_text/badges/main/pipeline.svg)](https://gitlab.com/rozpo.dev/platform_text)
[![coverage report](https://gitlab.com/rozpo.dev/platform_text/badges/main/coverage.svg)](https://gitlab.com/rozpo.dev/platform_text/-/jobs)
[![latest release](https://gitlab.com/rozpo.dev/platform_text/-/badges/release.svg)](https://gitlab.com/rozpo.dev/platform_text/-/releases)

## Features

[__PlatformText__](https://pub.dev/documentation/platform_text/latest/platform_text/PlatformText-class.html) returns [__Text__](https://api.flutter.dev/flutter/widgets/Text-class.html) or [__SelectableText__](https://api.flutter.dev/flutter/material/SelectableText-class.html) widget depending on the platform it's running on.
- Native &rarr; [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
- Web &rarr; [SelectableText](https://api.flutter.dev/flutter/material/SelectableText-class.html)

## Getting started

Follow official installation guide. [see more...](https://pub.dev/packages/platform_text/install)

## Usage

[PlatformText](https://pub.dev/documentation/platform_text/latest/platform_text/PlatformText-class.html) supports two constructors/widget classes: [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) and [SelectableText](https://api.flutter.dev/flutter/material/SelectableText-class.html).

To migrate existing code just replace [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)/[SelectableText](https://api.flutter.dev/flutter/material/SelectableText-class.html) widget with [PlatformText](https://pub.dev/documentation/platform_text/latest/platform_text/PlatformText-class.html).

- Create a [PlatformText](https://pub.dev/documentation/platform_text/latest/platform_text/PlatformText-class.html) widget.

```dart
PlatformText('Hello mom!');
```

- Create a [PlatformText](https://pub.dev/documentation/platform_text/latest/platform_text/PlatformText-class.html) widget with the [InlineSpan](https://api.flutter.dev/flutter/painting/InlineSpan-class.html).

```dart
PlatformText.rich(
  TextSpan(
    text: 'Hello',
    children: <TextSpan>[
      TextSpan(
        text: ' beautiful ',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      TextSpan(
        text: 'mom!',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  ),
);
```
## Support

If you like my package you can buy me a coffee.

[buymeacoffee.com/rozpo.dev](https://www.buymeacoffee.com/rozpo.dev)

## Additional information

- Package maintainer: _Piotr Rozpończyk_ [rozpo.dev](https://rozpo.dev)
- Technical writer: _Dawid Ratusz_
- Bug reporting: [issues](https://gitlab.com/rozpo.dev/platform_text/-/issues)
- Source code: [gitlab](https://gitlab.com/rozpo.dev/platform_text)
