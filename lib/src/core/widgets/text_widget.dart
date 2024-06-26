import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final Color color;
  final int maxLine;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? underline;
  final TextAlign? textAlign;

  const TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.maxLine,
      required this.fontFamily,
      required this.fontWeight,
      required this.fontSize,
      this.underline = TextDecoration.none,
      this.textAlign = TextAlign.start});
  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLine,
      textAlign: widget.textAlign,
      style: TextStyle(
          decoration: widget.underline!,
          overflow: TextOverflow.ellipsis,
          color: widget.color,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize),
    );
  }
}
