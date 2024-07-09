import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';
import '../../presentation/bloc/send_sos/send_sos_bloc.dart';

void sendSos(BuildContext context) async{
  var profileInfo = context.read<ProfileBloc>().state.profileInfo;
  var sosMessage = profileInfo?.sosMessage;
  var currentUserPhone = profileInfo?.phone;
  List<String> emContactPhoneList = context.read<EmergencyContactBloc>().state.emContacts.map((contact) => contact.phoneNumber).toList();
  final pos = !profileInfo!.sendSosGeolocation ? null : await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  context.read<SendSosBloc>().add(SendSosEvent.sendSOS(
    message: sosMessage == null || sosMessage.isEmpty ? 'SOS' : sosMessage,
    currentUserPhone: currentUserPhone!,
    emContactPhone: emContactPhoneList, lat: pos?.latitude.toString(), long: pos?.longitude.toString() ,
  ));
}