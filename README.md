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

PlatformText package returns Text or SelectableText widgets depends on running platform respectively.
- Native -> [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
- Web -> [SelectableText](https://api.flutter.dev/flutter/material/SelectableText-class.html)

## Getting started

To use package please follow official installation guide. [see more...](https://pub.dev/packages/platform_text/install)

## Usage

PlatformText widget supports two constructors as in Text or SelectableText widgets classes.

To migrate existing code just replace Text/SelectableText widget with PlatformWidget.

- Create a platform text widget.

```dart
PlatformText('Hello mom!');
```

- Create a platform text widget with a InlineSpan.

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
),
```
## Support

If you like my package you can buy me a coffee.

<a href="https://www.buymeacoffee.com/rozpo.dev"><img src="https://img.buymeacoffee.com/api/?url=aHR0cHM6Ly9jZG4uYnV5bWVhY29mZmVlLmNvbS91cGxvYWRzL3Byb2ZpbGVfcGljdHVyZXMvMjAyMi8wMy9GYXBDamRkWUltZkFPSElsLnBuZ0AzMDB3XzBlLndlYnA=&creator=Piotr+Rozpo%C5%84czyk&design_code=1&design_color=%23ff813f&slug=rozpo.dev" width="500" height=250></a>

## Additional information

- Package maintainer: [rozpo.dev](https://rozpo.dev)
- Technical writer: [rawid]()
- Source code: [gitlab](https://gitlab.com/rozpo.dev/platform_text)
- Bug reporting: [issues](https://gitlab.com/rozpo.dev/platform_text/-/issues)