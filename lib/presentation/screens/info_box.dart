import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_score_page/cubit/results_state.dart';

import '../../cubit/results_cubit.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimons.dart';
import '../../core/constants/app_strings.dart';

class InfoBox extends StatefulWidget {
  const InfoBox({super.key});

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: BlocBuilder<ResultsCubit, ResultsState>(
          builder: (context, state) {
            return Row(
              children: [

                /// #8
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.d10,
                    ),
                  ),
                  width: AppDimensions.d40,
                  height: AppDimensions.d38,
                  child: const Center(
                    child: Text(
                      '#8',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: AppDimensions.d18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                /// clock info
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/clock_icon.png",
                          width: AppDimensions.d16,
                          height: AppDimensions.d16,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "12:03",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.d14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppStrings.spendT,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.d12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                ///percentage info
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/percent.png",
                          width: AppDimensions.d16,
                          height: AppDimensions.d16,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "78",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.d14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      AppStrings.totalS,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.d12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
