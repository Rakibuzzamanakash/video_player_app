import 'package:flutter/material.dart';

class AppDimension{
  BuildContext context;

  AppDimension(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}