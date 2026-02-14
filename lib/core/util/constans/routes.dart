import 'package:flutter/material.dart';
import 'package:project_1/features/gold/presentation/screen/widgets/gold_screen.dart';
import 'package:project_1/features/home/presentation/screen/widgets/home_screen.dart';
import 'package:project_1/features/silver/presentation/screen/widgets/silver_screen.dart';

class Routes 
{
  static const String homeScreen='/HomeScreen';
  static const String goldScreen='/GoldScreen';
  static const String silverScreen='/SilverScreen';


  
 static final Map<String,WidgetBuilder>routesApp=
  {
    homeScreen:(context)=> HomeScreen(),
    goldScreen:(context)=>GoldScreen(),
    silverScreen:(context)=>SilverScreen(),
    
  };
}