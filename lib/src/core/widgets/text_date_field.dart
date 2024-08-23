import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TextDateFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? valtext;
  final bool obscureText;
  final String hintText;
  final Color hintTextColor;
  final bool readOnly;
  final int maxLine;
  final TextInputType keyType;
  final int? wordLimit;
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final Function()? onSuffixTap;
  final Widget? prefixIcon;
  final double? height;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  const TextDateFieldWidget(
      {super.key,
      required this.controller,
      required this.valtext,
      this.obscureText = false,
      required this.hintText,
      this.hintTextColor = CommonColor.hintTextColor,
      required this.readOnly,
      required this.maxLine,
      required this.keyType,
      this.wordLimit,
      required this.onChanged,
      this.suffixIcon,
      this.onSuffixTap,
      this.prefixIcon,
      this.height,
      required this.fontFamily,
      required this.fontWeight,
      required this.fontSize});
  @override
  State<TextDateFieldWidget> createState() => _TextDateFieldWidgetState();
}

class _TextDateFieldWidgetState extends State<TextDateFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: false,
      cursorColor: CommonColor.blackColor,
      obscureText: widget.obscureText,
      controller: widget.controller,
      readOnly: true,
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
      onChanged: (selectedDate) {},
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate:
                    DateTime(2024, DateTime.now().month, DateTime.now().day),
                lastDate: DateTime(2025, 12, 30))
            .then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              widget.onChanged(DateFormat('yyyy-MM-dd').format(selectedDate));
              widget.controller.text =
                  DateFormat('dd MMMM, y').format(selectedDate);
            });
          }
        });
      },
      autofocus: false,
      style: TextStyle(
          color: CommonColor.blackColor,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: 16),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
        focusedBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(5),
          borderSide:
              BorderSide(color: CommonColor.textFieldBorderColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(5),
          borderSide:
              BorderSide(color: CommonColor.textFieldBorderColor, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: CommonColor.redColors, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: CommonColor.redColors, width: 1.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: widget.hintTextColor,
            fontFamily: AppStrings.inter,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () {
                  widget.onSuffixTap!();
                },
                child: widget.suffixIcon),
        prefixIcon: widget.prefixIcon == null
            ? null
            : GestureDetector(child: widget.prefixIcon),
      ),
    );
  }
}
