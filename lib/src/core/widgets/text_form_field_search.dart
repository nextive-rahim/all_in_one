import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldSearchWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? valtext;
  final bool obscureText;
  final String hintText;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final Function()? onSuffixTap;
  final Function()? onPreffixTap;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  const TextFormFieldSearchWidget(
      {super.key,
      required this.controller,
      required this.valtext,
      this.obscureText = false,
      required this.hintText,
      required this.readOnly,
      required this.maxLine,
      required this.keyType,
      this.wordLimit,
      required this.onChanged,
      this.suffixIcon,
      this.onSuffixTap,
      this.preffixIcon,
      this.onPreffixTap,
      this.height,
      required this.fontFamily,
      required this.fontWeight,
      required this.fontSize});
  @override
  State<TextFormFieldSearchWidget> createState() =>
      _TextFormFieldSearchWidgetState();
}

class _TextFormFieldSearchWidgetState extends State<TextFormFieldSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: false,
      cursorColor: CommonColor.blackColor,
      obscureText: widget.obscureText,
      controller: widget.controller,
      readOnly: widget.readOnly,
      keyboardType: widget.keyType,
      maxLines: widget.maxLine,
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: widget.wordLimit != null
          ? [
              LengthLimitingTextInputFormatter(widget.wordLimit),
            ]
          : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.valtext;
        }
        return null;
      },
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {});
      },
      autofocus: false,
      style: TextStyle(
          color: CommonColor.blackColor,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: CommonColor.whiteColor,
        contentPadding: const EdgeInsets.fromLTRB(29, 10, 10, 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: CommonColor.whiteColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: CommonColor.whiteColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: CommonColor.whiteColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: CommonColor.whiteColor, width: 1.0),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: CommonColor.hintTextColor,
            fontFamily: AppStrings.inter,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        prefixIcon: widget.preffixIcon == null
            ? null
            : GestureDetector(
                onTap: () {
                  widget.onPreffixTap!();
                },
                child: widget.preffixIcon),
        suffix: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () {
                  widget.onSuffixTap!();
                },
                child: widget.suffixIcon),
      ),
    );
  }
}
