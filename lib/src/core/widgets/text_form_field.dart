import 'package:all_in_one/src/core/theme/colors.dart';
import 'package:all_in_one/src/core/theme/text_style.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedInputField extends StatefulWidget {
  const OutlinedInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.isPasswordField = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.bottomPadding,
    this.showBorder = true,
    this.height,
    this.borderColor,
    this.readOnly = false,
    this.isEnabled = true,
    this.labelText,
    // this.autofilled,
    this.autofocus,
    this.labelTextColor,
  });
  final bool? autofocus;
  final TextEditingController controller;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPasswordField;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final double? bottomPadding;
  final bool? showBorder;
  final double? height;
  final Color? borderColor;
  final bool? readOnly;
  final bool? isEnabled;
  final String? labelText;
  // final String? autofilled;
  final Color? labelTextColor;

  @override
  State<OutlinedInputField> createState() => _OutlinedInputFieldState();
}

class _OutlinedInputFieldState extends State<OutlinedInputField> {
  final ValueNotifier<bool> showPassword = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showError = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText != null
              ? Text(
                  widget.labelText ?? '',
                  style: AppTextStyle.medium14.copyWith(
                      color: widget.labelTextColor ?? AppColors.black),
                )
              : const Offstage(),
          widget.showBorder == false
              ? const SizedBox(height: 7)
              : const Offstage(),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: ValueListenableBuilder<String?>(
              valueListenable: errorMessage,
              builder: (BuildContext context, String? value, child) {
                return TextFormField(
                  autofocus: false,
                  // autofillHints: <String>[widget.autofilled ?? ''],
                  readOnly: widget.readOnly!,
                  textAlign: TextAlign.left,
                  enabled: widget.isEnabled,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  textAlignVertical: TextAlignVertical.center,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  textInputAction:
                      widget.textInputAction ?? TextInputAction.next,
                  style: AppTextStyle.regular15.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  obscureText:
                      widget.isPasswordField ? !showPassword.value : false,
                  decoration: InputDecoration(
                    disabledBorder: widget.isEnabled == false
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: CommonColor.purpleColor1,
                            ),
                          )
                        : null,
                    enabledBorder: widget.showBorder == false
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Colors.transparent,
                            ),
                          )
                        : Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder
                            ?.copyWith(
                              borderSide: BorderSide(
                                color: widget.borderColor ??
                                    AppColors.lightBlack40,
                                width: 0.5,
                              ),
                            ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(
                        color: widget.showBorder == false
                            ? Colors.transparent
                            : CommonColor.purpleColor1,
                      ),
                    ),
                    filled: true,
                    fillColor: widget.isEnabled == false
                        ? AppColors.transparent
                        : widget.fillColor ?? AppColors.transparent,
                    prefixIcon: widget.prefix,
                    suffixIcon: widget.isPasswordField
                        ? _passwordSuffix()
                        : widget.suffix,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle:
                        const TextStyle(color: CommonColor.hintTextColor),
                  ),
                  inputFormatters: widget.inputFormatters,
                  onChanged: (v) {
                    if (showError.value) {
                      showError.value = false;
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!(v);
                    }
                  },
                  validator: (v) {
                    if (widget.validator != null) {
                      errorMessage.value = widget.validator!(v);
                      showError.value = true;
                      return errorMessage.value;
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: showError,
            builder: (BuildContext context, bool value, child) {
              return ValueListenableBuilder<String?>(
                valueListenable: errorMessage,
                builder: (BuildContext context, String? value, child) {
                  if (showError.value && errorMessage.value != null) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 5,
                      ),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Offstage();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  IconButton _passwordSuffix() {
    return IconButton(
      onPressed: () {
        setState(() {
          showPassword.value = !showPassword.value;
        });
      },
      icon: Icon(
        !showPassword.value
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: CommonColor.purpleColor1,
        size: 20,
      ),
    );
  }
}

class TextFormFieldWidget extends StatefulWidget {
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
  final bool isEmailField;
  final String? Function(String?)? validator;
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      this.isEmailField = false,
      required this.valtext,
      this.obscureText = false,
      this.validator,
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
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
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
        if (widget.isEmailField) {
          const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
          final regex = RegExp(pattern);

          return value!.isEmpty || !regex.hasMatch(value)
              ? 'Enter a valid email address'
              : null;
        }
        if (value == null || value.isEmpty) {
          return widget.valtext;
        }
        return null;
      },
      onChanged: (value) {
        widget.onChanged(value);
      },
      autofocus: false,
      style: TextStyle(
          color: CommonColor.blackColor,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            EdgeInsets.fromLTRB(12, widget.maxLine != 1 ? 30 : 10, 12, 0),
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
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize,
        ),
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
