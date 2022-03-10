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

A Flutter package to make your text selectable for web and non-selectable for native builds.

[![pipeline status](https://gitlab.com/rozpo.dev/platform_text/badges/main/pipeline.svg)](https://gitlab.com/rozpo.dev/platform_text/-/commits/main)
[![coverage report](https://gitlab.com/rozpo.dev/platform_text/badges/main/coverage.svg)](https://gitlab.com/rozpo.dev/platform_text/-/commits/main)
[![latest release](https://gitlab.com/rozpo.dev/platform_text/-/badges/release.svg)](https://gitlab.com/rozpo.dev/platform_text/-/releases)

## Features

This package contains PlatformText widget as a wrapper for Text and SelectableText widgets. During application run this widget provide wrapped widgets depends on platform respectively.
- Native -> Text
- Web -> SelectableText

## Getting started

To use package include platform_text in your pubspec.yaml file.

## Usage

Use PlatformText widget with one required String parameter.

```dart
PlatformText('Hello mom!');
```

## Additional information

In case of any issues please contact me via https://rozpo.dev