import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void showPermissionAlertDialog(
  BuildContext context, {
  required Function(void) onClosed,
  String content = '',
}) {
  if (Platform.isIOS) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.permissionDenied,),
        content: Text(content),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text(AppLocalizations.of(context)!.cancel,),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => openAppSettings(),
            child:  Text(AppLocalizations.of(context)!.settings,),
          ),
        ],
      ),
    ).then(onClosed);
  } else if (Platform.isAndroid) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:  Text(AppLocalizations.of(context)!.permissionDenied,),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text(AppLocalizations.of(context)!.cancel,),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child:  Text(AppLocalizations.of(context)!.settings,),
          ),
        ],
      ),
    ).then(onClosed);
  }
}
