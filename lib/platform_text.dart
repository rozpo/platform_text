library platform_text;

import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle, TextHeightBehavior;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PlatformText extends StatelessWidget {
  // constructors
  const PlatformText(
    // Common fields
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
    // Text fields only
    this.locale,
    this.softWrap,
    this.overflow,
    // SelectableText fields only
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

  // Common fields
  final String? data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final ui.TextHeightBehavior? textHeightBehavior;
  final TextWidthBasis? textWidthBasis;

  // Text fields only
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;

  // SelectableText fields only
  final TextSpan? textSpan;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? minLines;
  final bool showCursor;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final ToolbarOptions toolbarOptions;
  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final ScrollPhysics? scrollPhysics;
  final SelectionChangedCallback? onSelectionChanged;

  // build
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SelectableText(data!, style: style, textAlign: textAlign);
    } else {
      return Text(data!, style: style, textAlign: textAlign);
    }
  }
}
