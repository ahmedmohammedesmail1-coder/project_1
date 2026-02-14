import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/features/gold/data/models/gold_model.dart';
import 'package:project_1/features/gold/data/repo/gold_repo.dart';
import 'package:project_1/features/gold/presentation/cubit/gold_states.dart';

class GoldCubit extends Cubit<GoldStates> {
  final GoldRepo goldRepo;
  GoldCubit(this.goldRepo) : super(GoldInitialState());
  static GoldCubit get(BuildContext context) =>
      BlocProvider.of<GoldCubit>(context);
  Future<void> getGoldData() async {
    emit(GoldLoadingState());
    final res = await goldRepo.getData();
    res.fold(
      ifLeft: (String error) {
        emit(GoldErrorState(error));
      },
      ifRight: (GoldModel repo) {
        emit(GoldSuccessState(repo));
      },
    );
  }
}
