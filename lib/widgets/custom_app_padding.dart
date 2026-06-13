import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final Widget child;
  final double? bottom;
  const AppPadding({super.key, required this.child, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50,
        left: 10,
        right: 10,
        bottom: bottom ?? 0,
      ),
      child: child,
    );
  }
}
