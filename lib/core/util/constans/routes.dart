import 'package:flutter/material.dart';
import 'package:project_1/features/home/presentation/screen/widgets/home_screen.dart';

class Routes 
{
  static const String homeScreen='/HomeScreen';


  
 static final Map<String,WidgetBuilder>routesApp=
  {
    homeScreen:(context)=> HomeScreen(),
    
  };
}