import 'package:flutter/material.dart';
import 'package:project_1/core/theme/theme.dart';
import 'package:project_1/core/util/constans/routes.dart';

void main() {
  runApp(const Goldy());
}

class Goldy extends StatelessWidget {
  const Goldy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeAppManager.darkTheme,
      routes: Routes.routesApp,
      initialRoute: Routes.homeScreen,
    );
  }
}
