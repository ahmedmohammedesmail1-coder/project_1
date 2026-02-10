import 'package:flutter/material.dart';

class PrimaryPadding extends StatelessWidget {
  const PrimaryPadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: child,
    );
  }
}