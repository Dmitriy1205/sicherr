import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/functions/firebase_exc_localizer.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../bloc/otp/otp_bloc.dart';
import '../../bloc/phone_number_change/phone_number_change_bloc.dart';
import '../../widgets/app_toast.dart';

///Uses [PhoneNumberChangeBloc] from context
class PhoneNumberChangeVerificationScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const PhoneNumberChangeVerificationScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<PhoneNumberChangeVerificationScreen> createState() => _PhoneNumberChangeVerificationScreenState();
}

class _PhoneNumberChangeVerificationScreenState extends State<PhoneNumberChangeVerificationScreen> {

  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  int _counter = 30;
  Timer? _timer;
  late String veriId;
  late String code;

  @override
  void initState() {
    veriId = widget.verificationId;
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: BlocConsumer<PhoneNumberChangeBloc, PhoneNumberChangeState>(
        listener: (context, state) {
          state.maybeMap(
            initial: (_){
              Navigator.of(context).pop();
            },
              success: (_) {
                final user = FirebaseAuth.instance.currentUser!;
                context.read<AuthBloc>().add(AuthEvent.initUser(user: user));
                context.read<ProfileBloc>().add(ProfileEvent.getProfileFields());
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              wait: (_) {
                if(_counter == 0){
                  setState(() {
                    _counter = 30;
                  });
                }
                  _startTimer();
              },
              error: (e) {
                AppToast.showError(context, FirebaseExceptionLocalizer.localize(context,
                    exceptionCode: e.code, exceptionMessage: e.message));
                context.read<PhoneNumberChangeBloc>().add(const PhoneNumberChangeEvent.reset());
              },
              orElse: () {});
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              surfaceTintColor: AppColors.white,
              backgroundColor: AppColors.white,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<PhoneNumberChangeBloc>().add(const PhoneNumberChangeEvent.reset());
                        // Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // Add padding to the Container itself
                        alignment: Alignment.centerRight,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.phoneVerification,
                      style: AppTheme.themeData.textTheme.displayLarge,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    Text(
                      AppLocalizations.of(context)!.enterSixDigits,
                      style: AppTheme.themeData.textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    Form(
                      key: _formKey,
                      child: PinCodeTextField(
                        focusNode: _focusNode,
                        validator: (value) {
                          code = value!;
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        pinTheme: PinTheme(
                          borderWidth: 0.2,
                          inactiveBorderWidth: 0.8,
                          activeBorderWidth: 0.8,
                          selectedBorderWidth: 0.8,
                          fieldHeight: 55,
                          fieldWidth: MediaQuery.of(context).size.height < 800
                              ? 50
                              : 55,
                          inactiveColor: Colors.grey,
                          activeColor: AppColors.mainAccent,
                          selectedColor: AppColors.mainAccent,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // controller: _numberController,
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          code = value;
                        },
                        onCompleted: (v) {
                          context.read<PhoneNumberChangeBloc>().add(PhoneNumberChangeEvent.verify(
                              verificationId: veriId, smsCode: v, newPhoneNumber: widget.phoneNumber));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    state.maybeMap(
                      wait: (_) => _counter > 0
                          ? Text(
                              '$_counter',
                              style: const TextStyle(fontSize: 36.0),
                            )
                          : InkWell(
                              onTap: () {
                                context.read<PhoneNumberChangeBloc>().add(PhoneNumberChangeEvent.sendCode(
                                    phoneNumber: widget.phoneNumber,));
                              },
                              borderRadius: BorderRadius.circular(5),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  AppLocalizations.of(context)!.resend,
                                  style: AppTheme
                                      .themeData.textTheme.headlineMedium!
                                      .copyWith(
                                          color: AppColors.mainAccent,
                                          fontSize: 14),
                                ),
                              ),
                            ),
                      verification: (_) => const LoadingIndicator(),
                      orElse: () => InkWell(
                        onTap: () {
                          context.read<PhoneNumberChangeBloc>().add(PhoneNumberChangeEvent.sendCode(
                              phoneNumber: widget.phoneNumber));
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            AppLocalizations.of(context)!.resend,
                            style: AppTheme.themeData.textTheme.headlineMedium!
                                .copyWith(
                                    color: AppColors.mainAccent, fontSize: 14),
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
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
