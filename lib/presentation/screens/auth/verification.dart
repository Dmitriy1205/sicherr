import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/functions/firebase_exc_localizer.dart';
import '../../bloc/notification/notification_bloc.dart';
import '../../bloc/otp/otp_bloc.dart';
import '../../widgets/app_toast.dart';

class VerificationScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const VerificationScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  int _counter = 30;
  Timer? _timer;
  late String veriId;
  late String code;

  @override
  void initState() {
    veriId = widget.verificationId;
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
      child: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          state.maybeMap(
              loaded: (_) {
                context.read<NotificationBloc>().add(const NotificationEvent.saveToken());
                context.read<SignInBloc>().add(const SignInEvent.init());
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
                context.read<OtpBloc>().add(const OtpEvent.reset());
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
                        context
                            .read<SignInBloc>()
                            .add(const SignInEvent.init());
                        context.read<OtpBloc>().add(const OtpEvent.reset());
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
                          context.read<OtpBloc>().add(OtpEvent.verify(
                              verificationId: veriId, smsCode: v));
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
                                // if(_counter == 0){
                                //   setState(() {
                                //     _counter = 30;
                                //
                                //   });
                                // }
                                // _startTimer();
                                context.read<OtpBloc>().add(OtpEvent.resendCode(
                                    phoneNumber: widget.phoneNumber,
                                    verifyId: (id) {
                                      veriId = id;
                                    }));

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
                          // if(_counter == 0){
                          //   setState(() {
                          //     _counter = 30;
                          //
                          //   });
                          // }
                          // _startTimer();
                          context.read<OtpBloc>().add(OtpEvent.resendCode(
                              phoneNumber: widget.phoneNumber,
                              verifyId: (id) {
                                veriId = id;
                              }));

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
