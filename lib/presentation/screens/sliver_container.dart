import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_score_page/cubit/results_state.dart';
import 'package:total_score_page/services/service.dart';

import '../../cubit/results_cubit.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/entity/player_model.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../models/result/result_model.dart';
import 'hover_user_tile.dart';

class SliverContainer extends StatefulWidget {

  const SliverContainer({super.key});

  @override
  State<SliverContainer> createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {

  final api=ApiService();
  late Results results;


  late int days = 0;
  late int hours = 0;
  late int minutes = 0;
  late int seconds = 0;



  @override
  void initState() {
    super.initState();
    getResultsFromApi();
  }


  void getResultsFromApi() async {
    final data = await api.getModel();
    setState(() {
      results = data!;
      convertSeconds(results.remainingTime);
    });
  }


  void convertSeconds(int totalSeconds) {
    days = totalSeconds ~/ (24 * 60 * 60);
    totalSeconds %= (24 * 60 * 60);
    hours = totalSeconds ~/ (60 * 60);
    totalSeconds %= (60 * 60);
    minutes = totalSeconds ~/ 60;
    seconds = totalSeconds % 60;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// text=> until ending of competition
                  const Text(
                    AppStrings.ending,
                    style: TextStyle(
                      fontSize: AppDimensions.d14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 15
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.sliderBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<ResultsCubit, ResultsState>(
                          builder: (context, state) {
                            final remaining =results.remainingTime;
                            if(remaining==null){
                              return SizedBox.shrink();
                            }
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Spacer(),
                                customColumn(
                                  '$days',
                                  AppStrings.day,
                                ),
                                const Spacer(),
                                line(),
                                const Spacer(),
                                customColumn(
                                  '$hours',
                                  AppStrings.hour,
                                ),
                                const Spacer(),
                                line(),
                                const Spacer(),
                                customColumn(
                                  '$minutes',
                                  AppStrings.minute,
                                ),
                                const Spacer(),
                                line(),
                                const Spacer(),
                                customColumn(
                                  '$seconds',
                                  AppStrings.second,
                                ),
                                const Spacer(),
                              ],
                            );
                            ;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: BlocBuilder<ResultsCubit, ResultsState>(
              builder: (context, state) {
                if (state is ResultsLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final result = state.results.allResults[index];
                        return HoverUserTile(user: result.toEntity(), order: index + 4,);
                      },
                      childCount: state.results.allResults.length,
                    ),
                  );
                } else if (state is ResultsLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is ResultsError) {
                  return SliverFillRemaining(
                    child: Center(child: Text("Error: ${state.message}")),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(child: Text("No data")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
