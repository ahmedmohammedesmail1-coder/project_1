import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/core/theme/colors.dart';
import 'package:project_1/core/theme/text_style.dart';
import 'package:project_1/core/util/constans/assets_helper.dart';
import 'package:project_1/core/util/constans/spacing.dart';
import 'package:project_1/core/widgets/primary/customText.dart';
import 'package:project_1/features/gold/data/models/gold_model.dart';
import 'package:project_1/features/gold/data/repo/gold_repo.dart';
import 'package:project_1/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:project_1/features/gold/presentation/cubit/gold_states.dart';

// ignore: must_be_immutable
class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  GoldModel? model;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGoldData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsManager.primaryColor,

          title: CustomText(
            text: 'Gold',
            style: TextStyleManager.bold20.copyWith(
              color: ColorsManager.goldColor,
            ),
          ),
        ),

        body: BlocBuilder<GoldCubit, GoldStates>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GoldErrorState) {
              return Center(
                child: CustomText(
                  text: state.error,
                  style: TextStyleManager.bold20.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                ),
              );
            }
            else if(state is GoldSuccessState)
            {
              model=state.goldModel;
              return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AssetsHelper.goldImage, scale: 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: model?.price.toString()??'00',
                      style: TextStyleManager.bold20.copyWith(
                        color: ColorsManager.goldColor,
                      ),
                    ),
                    horizontalSpace(4),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: CustomText(
                        text: 'EGP',
                        style: TextStyleManager.extraLight12.copyWith(
                          color: ColorsManager.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
