import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPhoneField extends StatefulWidget {
  const SearchPhoneField({
    super.key,
    this.height = 40,
    this.hintText = '',
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  final double height;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;

  @override
  State<SearchPhoneField> createState() => _SearchPhoneFieldState();
}

class _SearchPhoneFieldState extends State<SearchPhoneField> {
  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none,
  );
  late final TextEditingController _controller;
  final _focus = FocusNode();

  bool _showCancel = false;

  final _defaultController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? _defaultController;
    _focus.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    _defaultController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _showCancel = _focus.hasFocus;
    });
  }

  void _onTextChange() {
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _clearText() {
    _controller.clear();
    _focus.unfocus();
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
              controller: _controller,
              focusNode: _focus,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[ ()-]')),
              ],
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
              onSubmitted: widget.onChanged,
            ),
          ),
          if (_showCancel)
            GestureDetector(
              onTap: _clearText,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
