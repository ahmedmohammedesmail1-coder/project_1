import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_1/core/theme/colors.dart';
import 'package:project_1/core/theme/text_style.dart';
import 'package:project_1/core/util/constans/assets_helper.dart';
import 'package:project_1/core/util/constans/spacing.dart';
import 'package:project_1/core/widgets/primary/customText.dart';
import 'package:project_1/features/silver/data/models/silver_model.dart';
import 'package:project_1/features/silver/data/repo/sillver_repo.dart';
import 'package:project_1/features/silver/presentation/logic/silver_cubit.dart';
import 'package:project_1/features/silver/presentation/logic/silver_states.dart';

// ignore: must_be_immutable
class SilverScreen extends StatefulWidget {
  const SilverScreen({super.key});

  @override
  State<SilverScreen> createState() => _SilverScreenState();
}

class _SilverScreenState extends State<SilverScreen> {
  SilverModel? model;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..getSilverData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsManager.primaryColor,

          title: CustomText(
            text: 'Silver',
            style: TextStyleManager.bold20.copyWith(
              color: ColorsManager.silverColor,
            ),
          ),
        ),

        body: BlocBuilder<SilverCubit, SilverStates>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SilverErrorState) {
              return Center(
                child: CustomText(
                  text: state.error,
                  style: TextStyleManager.bold20.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                ),
              );
            } else if (state is SilverSuccessState) {
              model = state.silverModel;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsHelper.silverImage, scale: 1.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: model?.price.toStringAsFixed(3) ?? '00.000',
                        style: TextStyleManager.bold20.copyWith(
                          color: ColorsManager.silverColor,
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
