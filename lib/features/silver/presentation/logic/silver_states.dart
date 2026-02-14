import 'package:project_1/features/silver/data/models/silver_model.dart';

abstract class SilverStates {}
class SilverInitialState extends SilverStates{}
class SilverLoadingState extends SilverStates{}
class SilverSuccessState extends SilverStates{
  final SilverModel silverModel;
  SilverSuccessState(this.silverModel);
}
class SilverErrorState extends SilverStates{
  final String error;
  SilverErrorState(this.error);
}