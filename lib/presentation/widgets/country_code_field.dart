import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/functions/sort_country_codes.dart';
import '../../core/theme/theme.dart';
import '../../domain/entities/country_codes/country_codes.dart';
import 'app_country_code_picker/country_code_picker.dart';
import 'app_country_code_picker/country_codes.dart';

class CountryCodeField extends StatefulWidget {
  final Function(String) onChanged;

  const CountryCodeField({super.key, required this.onChanged});

  @override
  State<CountryCodeField> createState() => _CountryCodeFieldState();
}

class _CountryCodeFieldState extends State<CountryCodeField> {
  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();
  String isoCode = 'DE';
  String dialCode = '+49';
  List<CountryCodes> countryCodes = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/country_codes/country_codes.json');
    final data = await json.decode(response);
    setState(() {
      countryCodes =
          (data as List).map((e) => CountryCodes.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  int? _getMaxLength(CountryCodes country) {
    final phoneLength = country.phoneLength;

    if (phoneLength is int) {
      return phoneLength;
    } else if (phoneLength is List<dynamic>) {
      return phoneLength
          .reduce((value, element) => value > element ? value : element);
    } else {
      return null;
    }
  }

  bool _isLengthValid(String text, List<dynamic> lengths) {
    return lengths.contains(text.length);
  }

  List? _getMinLengths(CountryCodes country) {
    final phoneLength = country.phoneLength;

    if (phoneLength is int) {
      return [phoneLength];
    } else if (phoneLength is List<dynamic>) {
      return phoneLength.isNotEmpty ? phoneLength : null;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      maxLength: countryCodes.isNotEmpty
          ? _getMaxLength(countryCodes.firstWhere(
              (element) => element.code == isoCode,
            ))
          : null,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
      ],
      style: AppTheme.themeData.textTheme.displayLarge!
          .copyWith(fontWeight: FontWeight.w400),
      controller: _phoneController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCountryCodePicker(
                flagWidth: 25,
                textStyle: AppTheme.themeData.textTheme.displayLarge!
                    .copyWith(fontWeight: FontWeight.w400),
                showDropDownButton: true,
                padding: EdgeInsets.zero,
                searchDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
                onChanged: (v) {
                  dialCode = v.dialCode!;
                  isoCode = v.code!;
                },
                countryList: sortCountries(List.of(codes)),
              ),
              const SizedBox(
                width: 0,
              ),
              Container(
                width: 0.5,
                height: 50,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      onSaved: (value) {
        setState(() {
          _phoneController.text = value!;
        });
      },
      onTapOutside: (v) {
        _focusNode.unfocus();
      },
      onChanged: (value) {
        setState(() {
          _phoneController.text = value;
          if (_isLengthValid(
            _phoneController.text,
            _getMinLengths(countryCodes.firstWhere(
                  (element) => element.code == isoCode,
                )) ??
                [],
          )) {
            widget.onChanged('$dialCode${_phoneController.text}');
          } else {
            widget.onChanged('');
          }
        });
      },
    );
  }
}
