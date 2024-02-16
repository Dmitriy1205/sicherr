import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';

class SearchPhoneField extends StatelessWidget {
  const SearchPhoneField({
    super.key,
    this.height = 40,
    this.hintText = '',
    this.onChanged,
    this.onSubmitted,
  });
  final double height;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        maxLength: 13,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grey),
          counterText: '',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: SvgPicture.asset(
              AppIcons.search,
            ),
          ),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 16, maxHeight: 16),
          filled: true,
          fillColor: AppColors.lightGrey,
          contentPadding: EdgeInsets.zero,
          border: _border,
          focusedBorder: _border,
          enabledBorder: _border,
          disabledBorder: _border,
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}
