import 'package:flutter/material.dart';

class StackModel {
  final Widget widget;
  bool isOpen;
  double openHeight;
  double closedHeight;
  bool isActive;

  StackModel({
    required this.widget,
    this.isOpen = false,
    this.isActive = false,
    required this.openHeight,
    required this.closedHeight,
  });

  factory StackModel.createStack(
      {required Widget widget,
        required double openHeight,
        required double closedHeight}) {
    return StackModel(
      widget: widget,
      openHeight: openHeight,
      closedHeight: closedHeight,
    );
  }
}
