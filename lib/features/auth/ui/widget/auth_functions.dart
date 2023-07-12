import 'package:flutter/material.dart';

BoxDecoration buildBoxDecoration() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
              'assets/images/background_regqstrations.png'),
          fit: BoxFit.fill));
}

BoxDecoration buildBoxDecoration2() {
  return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ));
}