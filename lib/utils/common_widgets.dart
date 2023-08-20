import 'package:flutter/material.dart';

Widget getRegulaText(String text, {Color textColor = Colors.black87,double fontSize = 14, }){
  return Text(text,style: TextStyle(color: textColor,fontSize: fontSize),);
}

Widget getBoldText(String text, {Color textColor = Colors.black87,double fontSize = 14, }){
  return Text(text,style: TextStyle(color: textColor,fontSize: fontSize,fontWeight: FontWeight.bold),);
}