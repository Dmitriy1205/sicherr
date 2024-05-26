import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDropdownPicker extends StatefulWidget {
  final Function(String) onChange;
  final List<String> items;

  const AppDropdownPicker({super.key, required this.onChange, required this.items});

  @override
  State<AppDropdownPicker> createState() => _AppCurrencyPickerState();
}

class _AppCurrencyPickerState extends State<AppDropdownPicker> {
  List<String> currencyItems = [];

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        icon: const Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: FaIcon(FontAwesomeIcons.chevronDown,size: 20,color: AppColors.black,),
        ),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.notSelected,
              contentPadding:
                  const EdgeInsets.only(left: 20, ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(17.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(17.0),
              )),
          isExpanded: true,
          value: dropdownValue,
          menuMaxHeight: 250,
          items: widget.items.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }).toList(),
          onChanged: (v) {
            setState(() {
              dropdownValue = v!;
              widget.onChange(dropdownValue!);
            });
          }),
    );
  }
}
