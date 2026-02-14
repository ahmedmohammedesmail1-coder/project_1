import 'package:flutter/material.dart';
import 'package:project_1/core/theme/colors.dart';
import 'package:project_1/core/util/constans/routes.dart';
import 'package:project_1/core/util/constans/spacing.dart';
import 'package:project_1/core/util/constans/strings_app.dart';
import 'package:project_1/core/util/extensions/context_extention.dart';
import 'package:project_1/core/widgets/primary/custom_button.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {
              context.push(Routes.goldScreen);
            },
            color: ColorsManager.goldColor,
            text: StringsApp.gold,
          ),
          verticalSpace(20),
          CustomButton(
            onTap: () {
              context.push(Routes.silverScreen);
            },
            color: ColorsManager.silverColor,
            text: StringsApp.silver,
          ),
        ],
      ),
    );
  }
}
