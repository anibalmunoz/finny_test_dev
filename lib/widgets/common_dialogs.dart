import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommonDialogs {
  CommonDialogs._();
  static final CommonDialogs shared = CommonDialogs._();

  final bool _isIos = !kIsWeb && Platform.isIOS ? true : false;

  Future showNotifyDialog(
    BuildContext context, {
    required String tittle,
    String? contentString,
    Widget? content,
    String acceptButtonText = 'OK',
    bool? barrierDismissible,
    VoidCallback? onAccept,
    TextStyle? style,
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      builder: (context) => _isIos
          ? CupertinoAlertDialog(
              title: Text(tittle),
              content: content ?? Text(contentString ?? '', style: style),
              actions: [
                CupertinoDialogAction(
                  child: Text(acceptButtonText),
                  onPressed: () {
                    Navigator.pop(context);
                    onAccept?.call();
                  },
                ),
              ],
            )
          : AlertDialog(
              title: Text(tittle),
              content: content ?? Text(contentString ?? ''),
              actions: [
                TextButton(
                  child: Text(acceptButtonText),
                  onPressed: () {
                    Navigator.pop(context);
                    onAccept?.call();
                  },
                ),
              ],
            ),
    );
  }
}
