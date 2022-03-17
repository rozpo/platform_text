library platform_text;

import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle, TextHeightBehavior;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Main class for platform_text package.
///
/// [PlatformText] returns [Text] or [SelectableText] widget depending on the platform it's running on.
///
/// Native → [Text]
///
/// Web → [SelectableText]
///
/// {@category Class}
class PlatformText extends StatelessWidget {
  /// Only for UTs
  final bool webTest;

  /// Creates a [PlatformText] text widget.
  ///
  /// ## Features
  ///
  /// [PlatformText] returns [Text] or [SelectableText] widget depending on the platform it's running on.
  ///
  /// Native → [Text]
  ///
  /// Web → [SelectableText]
  ///
  /// ## Usage
  ///
  /// {@tool snippet}
  ///
  /// Create a [PlatformText] widget.
  ///
  /// ```dart
  /// PlatformText('Hello mom!');
  /// ```
  ///
  /// {@end-tool}
  ///
  const PlatformText(
    String this.data, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.locale,
    this.softWrap,
    this.overflow,
    this.focusNode,
    this.showCursor = false,
    this.autofocus = false,
    ToolbarOptions? toolbarOptions,
    this.minLines,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.scrollPhysics,
    this.onSelectionChanged,
    @visibleForTesting this.webTest = false,
  })  : assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        textSpan = null,
        toolbarOptions = toolbarOptions ??
            const ToolbarOptions(
              selectAll: true,
              copy: true,
            ),
        super(key: key);

  /// Creates a platform text widget with a [InlineSpan].
  ///
  /// ## Features
  ///
  /// [PlatformText] returns [Text] or [SelectableText] widget depending on the platform it's running on.
  ///
  /// Native → [Text]
  ///
  /// Web → [SelectableText]
  ///
  /// ## Usage
  ///
  /// {@tool snippet}
  ///
  /// Create a [PlatformText] widget with the [InlineSpan].
  ///
  /// ```dart
  /// PlatformText.rich(
  ///   TextSpan(
  ///     text: 'Hello',
  ///     children: <TextSpan>[
  ///       TextSpan(
  ///         text: ' beautiful ',
  ///         style: TextStyle(fontStyle: FontStyle.italic),
  ///       ),
  ///       TextSpan(
  ///         text: 'mom!',
  ///         style: TextStyle(fontWeight: FontWeight.bold),
  ///       ),
  ///     ],
  ///   ),
  /// );
  /// ```
  ///
  /// {@end-tool}
  ///
  const PlatformText.rich(
    TextSpan this.textSpan, {
    Key? key,
    this.focusNode,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.showCursor = false,
    this.autofocus = false,
    ToolbarOptions? toolbarOptions,
    this.minLines,
    this.maxLines,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.scrollPhysics,
    this.semanticsLabel,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.onSelectionChanged,
    this.locale,
    this.softWrap,
    this.overflow,
    @visibleForTesting this.webTest = false,
  })  : assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        data = null,
        toolbarOptions = toolbarOptions ??
            const ToolbarOptions(
              selectAll: true,
              copy: true,
            ),
        super(key: key);

  // =============
  // Common fields
  // =============

  /// The text to display.
  final String? data;

  /// If non-null, the style to use for this text.
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  final String? semanticsLabel;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  // ================
  // Text fields only
  // ================

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  // ==========================
  // SelectableText fields only
  // ==========================

  /// The text to display as a [TextSpan].
  final TextSpan? textSpan;

  /// Defines the focus for this widget.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool showCursor;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  final Color? cursorColor;

  /// Controls how tall the selection highlight boxes are computed to be.
  final ui.BoxHeightStyle selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  final ui.BoxWidthStyle selectionWidthStyle;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// Configuration of toolbar options.
  final ToolbarOptions toolbarOptions;

  /// {@macro flutter.widgets.editableText.selectionEnabled}
  bool get selectionEnabled => enableInteractiveSelection;

  /// Called when the user taps on this selectable text.
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.onSelectionChanged}
  final SelectionChangedCallback? onSelectionChanged;

  /// Build method with logic responsible for returnig proper widget depends on running platform.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || webTest) {
      if (data != null) {
        return SelectableText(data!, style: style, textAlign: textAlign);
      } else {
        return SelectableText.rich(textSpan!,
            style: style, textAlign: textAlign);
      }
    } else {
      if (data != null) {
        return Text(data!, style: style, textAlign: textAlign);
      } else {
        return Text.rich(textSpan!, style: style, textAlign: textAlign);
      }
    }
  }
}
