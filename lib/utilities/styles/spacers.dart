import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(
    this.space, {
    Key? key,
  }) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(height: space);
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(
    this.space, {
    Key? key,
  }) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(width: space);
}
