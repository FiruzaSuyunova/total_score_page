import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_score_page/presentation/screens/info_box.dart';
import 'package:total_score_page/presentation/screens/initial_row.dart';
import 'package:total_score_page/presentation/screens/sliver_container.dart';
import 'package:total_score_page/cubit/results_state.dart';
import 'package:total_score_page/services/service.dart';
import '../../core/constants/app_dimons.dart';
import 'winner_card.dart';
import '../../cubit/results_cubit.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultsCubit(apiService: apiService)..fetchResults(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              ///background color
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffF33C14), Color(0xffF37216)],
                  ),
                ),
              ),
            ),
            /// main body
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 24),

                ///initial row
                InitialRow(),
                const SizedBox(height: AppDimensions.d24),

                /// Info box
                InfoBox(),
                SizedBox(height: 12),
                Expanded(
                  child: NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        expandedHeight: 295,
                        pinned: false,
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.yellow,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xffF33C14), Color(0xffF37216)],
                              ),
                            ),
                            child: BlocBuilder<ResultsCubit, ResultsState>(
                              builder: (context, state) {
                                if (state is ResultsLoading) {
                                  return Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                } else if (state is ResultsError) {
                                  return Center(child: Text('error'));
                                } else if (state is ResultsLoaded) {
                                  final results = state.results.allResults;

                                  if (results.length >= 0) {
                                    /// winners row
                                    return Row(

                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        WinnerCard(
                                          player: results[2]
                                              .toEntityWithWinnerModel(),
                                          weight: 104,
                                          height: 180,
                                          color: 0xFFA7B1C9,
                                        ),
                                        // 3rd place
                                        WinnerCard(
                                          player: results[0]
                                              .toEntityWithWinnerModel(),
                                          weight:110 ,
                                          height:212 ,
                                          color: 0xFFFCDA1B,
                                        ),
                                        // 1st place
                                        WinnerCard(
                                          player: results[1]
                                              .toEntityWithWinnerModel(),
                                          weight: 104,
                                          height: 148,
                                          color: 0xFFD89142,
                                        ),
                                        // 2nd place
                                      ],
                                    );
                                  } else {
                                    return const Center(
                                      child: Text(
                                        "At least 3 results required",
                                      ),
                                    );
                                  }
                                }
                                return const Center(child: Text("No data"));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                    body: BlocBuilder<ResultsCubit, ResultsState>(
                      builder: (context, state) {
                        return SliverContainer();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}