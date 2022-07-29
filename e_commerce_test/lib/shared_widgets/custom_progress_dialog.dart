import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'dart:io';

class ProgressDialogHelper{
  late NAlertDialog dialog;

  showProgressDialog(BuildContext context, String text){
    dialog = NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: const Text("Please wait"),
      content: Row(
        children: [
          const CupertinoActivityIndicator(radius: 20,),
          const SizedBox(width: 10,),
          Text(text),
        ],
      ),
      blur: 2, dismissable: false,
    );
    dialog.show(context, transitionType: DialogTransitionType.Shrink);
  }

  hideProgressDialog(BuildContext context){
    Navigator.pop(context);
  }
}