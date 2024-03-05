import 'package:flutter/material.dart';
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
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onTextChange() {
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
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
            ),
          ),
          if (_focus.hasFocus)
            GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _controller.text = '';
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  AppLocalizations.of(context)!.cancel,
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
