import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../uitles/colors.dart';

class ShowMasseg {
  static ShowToastMasseg(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        textColor: LigthColor.whiteColor,
        fontSize: 16.0);

    // Fluttertoast.showToast(
    //       msg: msg,
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: color,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
  }

  static Future<bool> onWillPop(
      BuildContext context, String title, String masseg) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(masseg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('لا'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('نعم'),
              ),
            ],
          ),
        )) ??
        false;
  }

  static Future<bool> onDownlodfile(
      BuildContext context,
      // final void Function(int? value) onCancelSearch,
      String title,
      String masseg) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(masseg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('لا'),
              ),
              TextButton(
                onPressed: () =>Navigator.of(context).pop(true),
                // {
                //   Navigator.of(context).pop(false);
                //   onCancelSearch;
                // },
                child: Text('نعم'),
              ),
            ],
          ),
        )) ??
        false;
  }

  static ShowToastMassegError(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: color,
        textColor: LigthColor.whiteColor,
        fontSize: 16.0);
  }

  // static void showAwesDialog(
  //     BuildContext context,
  //     String? massegetatle,
  //     String? massegebody,
  //     DialogType dialogType,
  //     AnimType animType,
  //     void btnOkOnPress,
  //     void btnCancelOnPress) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: dialogType,
  //     animType: animType,
  //     title: massegetatle,
  //     desc: massegebody,
  //     titleTextStyle: TextStyle(fontFamily: "Rubik"),
  //     btnCancelOnPress: () {
  //       btnCancelOnPress;
  //     },
  //     btnOkOnPress: () {
  //       btnOkOnPress;
  //     },
  //   ).show();
  // }

  // static Future<void> Shownotification(String titlenof, String bodynof) async {
  //   await AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //     id: -1,
  //     channelKey: "basic_channel",
  //     title: titlenof,
  //     body: bodynof,
  //   ));
  // }
}

// void ShowAwesomeDiloge(BuildContext context,DialogType dialogType ){
//    AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.error,
//                     animType: AnimType.rightSlide,
//                     title: 'Error',
//                     desc: 'تأكد من ادخال جميع البيانات',
//                   ).show();
// }
