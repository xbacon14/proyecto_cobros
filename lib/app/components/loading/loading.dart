import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Loading {
  final String message;
  final BuildContext context;

  ProgressDialog _pr;

  Loading(this.context, this.message);

  Loading.show(this.context, this.message) {
    _pr = new ProgressDialog(
      this.context,
    );
    _pr.style(
        message: message,
        borderRadius: 10.0,
        backgroundColor: Colors.white60,
        progressWidget: CircularProgressIndicator(
          backgroundColor: Colors.green,
          strokeWidth: 5,
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.green, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black45,
            fontSize: 19.0,
            fontWeight: FontWeight.w600));
    _pr.show();
  }

  close() async {
    await _pr.hide();
  }
}
