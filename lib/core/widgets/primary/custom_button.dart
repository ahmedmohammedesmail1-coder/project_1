import 'package:flutter/material.dart';
import 'package:project_1/core/theme/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
  });
  final void Function()? onTap;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 35,
        width: 250,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),

          child: Container(
            height: 35,
            width: 250,

            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: ColorsManager.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
