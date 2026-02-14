import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/features/silver/data/models/silver_model.dart';
import 'package:project_1/features/silver/data/repo/sillver_repo.dart';
import 'package:project_1/features/silver/presentation/logic/silver_states.dart';

class SilverCubit extends Cubit<SilverStates> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(SilverInitialState());
  static SilverCubit get(BuildContext context) =>
      BlocProvider.of<SilverCubit>(context);
  Future<void> getSilverData() async {
    emit(SilverLoadingState());
    final res = await silverRepo.getData();
    res.fold(
      ifLeft: (String error) {
        emit(SilverErrorState(error));
      },
      ifRight: (SilverModel repo) {
        emit(SilverSuccessState(repo));
      },
    );
  }
}
