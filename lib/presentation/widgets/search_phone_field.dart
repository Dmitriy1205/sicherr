import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';

class SearchPhoneField extends StatefulWidget {
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

  @override
  State<SearchPhoneField> createState() => _SearchPhoneFieldState();
}

class _SearchPhoneFieldState extends State<SearchPhoneField> {
  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  );

  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              focusNode: _focus,
              decoration: InputDecoration(
                hintText: widget.hintText,
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
              onSubmitted: widget.onSubmitted,
              onChanged: widget.onChanged,
            ),
          ),
          if (_focus.hasFocus)
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
