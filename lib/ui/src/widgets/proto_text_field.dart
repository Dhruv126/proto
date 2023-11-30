import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proto/constants/colors.dart';

class ProtoTextField extends StatefulWidget {
  final String hintText;
  final Function? onChanged;
  final bool isPasswordField;
  final TextInputType? inputType;
  final bool isDescriptionField;
  final VoidCallback? onTap;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final double? height;
  final bool isEditable;
  final bool readOnly;
  final bool enabled;
  final bool needFormatter;
  final bool needBorder;
  final List<TextInputFormatter>? textInputFormatters;
  final int? maxLength;

  ProtoTextField(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.isPasswordField = false,
      this.inputType,
      this.isDescriptionField = false,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.height,
      this.currentNode,
      this.nextNode,
      this.isEditable = false,
      this.readOnly = false,
      this.enabled = true,
      this.needFormatter = false,
      this.textInputFormatters,
      this.maxLength,
      this.needBorder = false})
      : super(key: key);

  @override
  State<ProtoTextField> createState() => _ProtoTextFieldState();
}

class _ProtoTextFieldState extends State<ProtoTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPasswordField;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.isEditable
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: AppColors.boxGray),
              color: AppColors.appWhite)
          : null,
      height: widget.height,
      child: widget.isEditable
          ? textField()
          : Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(
                      color: widget.needBorder
                          ? AppColors.borderColorDate
                          : AppColors.transparent)),
              elevation: 10,
              child: textField(),
            ),
    );
  }

  IconButton passwordSuffixIcon() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  Widget textField() {
    return TextField(
      maxLength: widget.maxLength ?? 1000,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      focusNode: widget.currentNode,
      onSubmitted: (term) {
        widget.currentNode?.unfocus();
        FocusScope.of(context).requestFocus(widget.nextNode ?? null);
      },
      inputFormatters: widget.needFormatter ? widget.textInputFormatters : null,
      controller: widget.controller,
      onTap: widget.onTap,
      minLines: 1,
      textInputAction:
          widget.nextNode == null ? TextInputAction.done : TextInputAction.next,
      enableSuggestions: false,
      maxLines: widget.isDescriptionField ? 8 : 1,
      keyboardType: widget.inputType,
      obscureText: _obscureText,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: AppColors.textHintColor),
      decoration: InputDecoration(
        counterText: '',
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: AppColors.textHintColor),
        contentPadding: EdgeInsets.fromLTRB(
          15.w,
          11.h,
          8.w,
          15.h,
        ),
        suffixIcon:
            widget.isPasswordField ? passwordSuffixIcon() : widget.suffixIcon,
      ),
      onChanged: (text) {
        if (widget.onChanged != null) widget.onChanged!(text);
      },
    );
  }
}
