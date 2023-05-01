import 'package:flutter/material.dart';


class CustomSnackbar {

  static priKey(
      {required String text,
      Color? textColor,
      Widget? icon,
      Color? color,
      required GlobalKey<ScaffoldState> key}){
    final snackBar = SnackBar(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      behavior:  SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      backgroundColor: color ?? Colors.red,
      content: Row(
        children: [
          icon ?? Icon(Icons.warning_amber_sharp, color: textColor ?? Colors.white,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: textColor ?? Colors.white),),
        ],
      ),
    );

    ScaffoldMessenger.of(key.currentContext!).showSnackBar(snackBar);
  }

  static context(
      {required String text,
      Color? textColor,
      Widget? icon,
      Color? color,
        required BuildContext context}){
    final snackBar = SnackBar(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      behavior:  SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      backgroundColor: color ?? Colors.red,
      content: Row(
        children: [
          icon ?? Icon(Icons.warning_amber_sharp, color: textColor ?? Colors.white,),
          SizedBox(width: 5,),
          Expanded(child: Text(text, style: TextStyle(color: textColor ?? Colors.white),)),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}