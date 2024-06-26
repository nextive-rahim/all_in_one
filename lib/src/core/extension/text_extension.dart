import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text fontSize(
    double fontSize,
  ) {
    Text newWidget = Text(
      data!,
      style: style == null
          ? TextStyle(fontSize: fontSize)
          : style?.copyWith(fontSize: fontSize),
    );
    return newWidget;
  }

  Text bold([FontWeight fontWeight = FontWeight.w500]) {
    Text newWidget = Text(
      data!,
      style: style == null
          ? TextStyle(fontWeight: fontWeight)
          : style?.copyWith(fontWeight: fontWeight),
    );
    return newWidget;
  }

  Text lineHeight([double lineHeight = 20]) {
    Text newWidget = Text(
      data!,
      style: style == null
          ? TextStyle(height: lineHeight)
          : style?.copyWith(height: lineHeight),
    );
    return newWidget;
  }

  Text color([Color color = AppColors.black]) {
    Text newWidget = Text(
      data!,
      style: style == null
          ? TextStyle(color: color)
          : style?.copyWith(color: color),
    );
    return newWidget;
  }

  Text textMaxLIne(int max) {
    Text newWidget = Text(
      data!,
      maxLines: maxLines ?? max,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
    return newWidget;
  }
}
