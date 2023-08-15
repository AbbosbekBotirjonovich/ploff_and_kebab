import 'package:flutter/material.dart';

sealed class MyTextStyle{
  const MyTextStyle._();


  static TextStyle w600 = const TextStyle(
    fontFamily: 'SFPRODISPLAY',
    fontWeight: FontWeight.w600
  );

  static TextStyle w500 = const TextStyle(
    fontFamily: 'SFPRODISPLAY',
    fontWeight: FontWeight.w500
  );

  static TextStyle w400 = const TextStyle(
    fontFamily: 'SFPRODISPLAY',
    fontWeight: FontWeight.w400
  );

}