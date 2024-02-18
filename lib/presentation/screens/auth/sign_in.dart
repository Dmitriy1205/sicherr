import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/core/functions/firebase_exc_localizer.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/domain/entities/country_codes/country_codes.dart';
import 'package:sicherr/presentation/screens/auth/verification.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/screens/terms_and_conditions.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
import '../../../core/const/colors.dart';
import '../../bloc/sign_in/sign_in_bloc.dart';
import '../../widgets/app_country_code_picker/country_code_picker.dart';
import '../../widgets/app_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();
  String isoCode = 'UA';
  String dialCode = '+380';
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
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white, // Set status bar color here
      ));
    }
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        state.maybeMap(
            verified: (_) =>
                AppToast.showSuccess(context, AppLocalizations.of(context)!.successfullyAuthorized),
            unVerified: (_) {
              AppToast.showSuccess(context, AppLocalizations.of(context)!.verificationCodeSent);
            },
            error: (e) => AppToast.showError(
                context,
                FirebaseExceptionLocalizer.localize(context,
                    exceptionCode: e.code, exceptionMessage: e.message)),
            orElse: () {});
      },
      builder: (context, state) {
        return state.maybeMap(
          unVerified: (_) => VerificationScreen(
            verificationId: state.verificationId!,
            phoneNumber: state.phoneNumber!,
          ),
          verified: (_) => const InitialScreen(),
          orElse: () => Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(
                    AppImages.background,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 100,
                    child: Image.asset(
                      AppImages.logo,
                      scale: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.singIn,
                              style: AppTheme.themeData.textTheme.headlineLarge,
                            ),
                            Text(
                              AppLocalizations.of(context)!.begin,
                              style: AppTheme.themeData.textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              maxLength: countryCodes.isNotEmpty
                                  ? _getMaxLength(countryCodes.firstWhere(
                                      (element) => element.code == isoCode,
                                    ))
                                  : null,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,1}')),
                              ],
                              style: AppTheme.themeData.textTheme.displayLarge!
                                  .copyWith(fontWeight: FontWeight.w400),
                              // textAlign: TextAlign.center,
                              controller: _phoneController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppCountryCodePicker(
                                        flagWidth: 25,
                                        textStyle: AppTheme
                                            .themeData.textTheme.displayLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        showDropDownButton: true,
                                        padding: EdgeInsets.zero,
                                        searchDecoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 0),
                                        ),
                                        onChanged: (v) {
                                          dialCode = v.dialCode!;
                                          isoCode = v.code!;
                                        },
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
                                  print('$dialCode + ${_phoneController.text}');
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 48,
                              child: AppElevatedButton(
                                widget: state.maybeMap(
                                    loading: (_) => const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: LoadingIndicator(
                                          color: Colors.white,
                                        )),
                                    orElse: () => Text(
                                          AppLocalizations.of(context)!.singIn,
                                          style: AppTheme
                                              .themeData.textTheme.labelMedium,
                                        )),
                                text: AppLocalizations.of(context)!.singIn,
                                onPressed: countryCodes.isNotEmpty &&
                                        !_isLengthValid(
                                          _phoneController.text,
                                          _getMinLengths(
                                                  countryCodes.firstWhere(
                                                (element) =>
                                                    element.code == isoCode,
                                              )) ??
                                              [],
                                        )
                                    ? null
                                    : () {
                                        context.read<SignInBloc>().add(
                                            SignInEvent.login(
                                                phoneNumber:
                                                    '$dialCode${_phoneController.text}',
                                                verifyId: (verId) {}));
                                      },
                                borderRadius: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.byContinuing,
                                    style: AppTheme
                                        .themeData.textTheme.titleMedium,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TermsAndConditions()));
                                    },
                                    borderRadius: BorderRadius.circular(5),
                                    child: Text(
                                      AppLocalizations.of(context)!.terms,
                                      style: AppTheme
                                          .themeData.textTheme.titleMedium!
                                          .copyWith(
                                              color: AppColors.mainAccent),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
