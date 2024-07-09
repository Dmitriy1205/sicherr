import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/presentation/bloc/phone_number_change/phone_number_change_bloc.dart';
import 'package:sicherr/presentation/screens/change_phone_number/phone_number_change_verification.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/functions/firebase_exc_localizer.dart';
import '../../../core/functions/sort_country_codes.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/theme/theme.dart';
import '../../../domain/entities/country_codes/country_codes.dart';
import '../../widgets/app_country_code_picker/country_code_picker.dart';
import '../../widgets/app_country_code_picker/country_codes.dart';

class ChangePhoneNumberScreen extends StatefulWidget {
  const ChangePhoneNumberScreen({super.key});

  @override
  State<ChangePhoneNumberScreen> createState() =>
      _ChangePhoneNumberScreenState();
}

class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
  final _bloc = sl<PhoneNumberChangeBloc>();

  final _phoneController = TextEditingController();

  final _focusNode = FocusNode();

  String isoCode = 'DE';

  String dialCode = '+49';

  List<CountryCodes> countryCodes = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneNumberChangeBloc, PhoneNumberChangeState>(
      bloc: _bloc,
      listener: (context, state) {
        state.maybeMap(
            wait: (state) {
              AppToast.showSuccess(
                  context, AppLocalizations.of(context)!.verificationCodeSent);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: _bloc,
                    child: PhoneNumberChangeVerificationScreen(
                          phoneNumber: state.phoneNumber,
                          verificationId: state.verificationId,
                        ),
                  )));
            },
            error: (e) => AppToast.showError(
                context,
                FirebaseExceptionLocalizer.localize(context,
                    exceptionCode: e.code, exceptionMessage: e.message)),
            orElse: () {});
      },
      builder: (context, state) => Scaffold(
        appBar: DefaultAppBar(
          title: AppLocalizations.of(context)!.change_phone_number,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _enterPhoneNumberTitle(),
              SizedBox(
                height: 22,
              ),
              _phoneNumberInput(),
              Spacer(),
              _saveButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Widget _saveButton() => AppElevatedButton(
      text: AppLocalizations.of(context)!.save,
      onPressed: countryCodes.isEmpty || countryCodes.isNotEmpty &&
              !_isLengthValid(
                _phoneController.text,
                _getMinLengths(countryCodes.firstWhere(
                      (element) => element.code == isoCode,
                    )) ??
                    [],
              )
          ? null
          : () {
        final phoneNumberWithCountryCode = dialCode + _phoneController.text;
            _bloc.add(PhoneNumberChangeEvent.sendCode(
              phoneNumber: phoneNumberWithCountryCode));
          });

  Widget _enterPhoneNumberTitle() {
    return Text(
      AppLocalizations.of(context)!.enter_new_phone_number,
      style: AppTheme.themeData.textTheme.headlineMedium,
    );
  }

  Widget _phoneNumberInput() {
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
      // textAlign: TextAlign.center,
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
                  setState(() {
                    dialCode = v.dialCode!;
                    isoCode = v.code!;
                  });
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
        });
      },
    );
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/country_codes/country_codes.json');
    final data = await json.decode(response);
    setState(() {
      countryCodes =
          (data as List).map((e) => CountryCodes.fromJson(e)).toList();
    });
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
}
