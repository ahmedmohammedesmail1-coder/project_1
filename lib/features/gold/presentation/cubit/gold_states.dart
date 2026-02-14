import 'package:project_1/features/gold/data/models/gold_model.dart';

abstract class GoldStates {}
class GoldInitialState extends GoldStates{}
class GoldLoadingState extends GoldStates{}
class GoldSuccessState extends GoldStates{
  final GoldModel goldModel;
  GoldSuccessState(this.goldModel);
}
class GoldErrorState extends GoldStates{
  final String error;
  GoldErrorState(this.error);
}