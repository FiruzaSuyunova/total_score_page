import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/winner_card.dart';
import '../../core/widgets/hover_user_tile.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../data/dummy/winner_list.dart';
import '../../data/dummy/player_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
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
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 24),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius8,
                        ),
                      ),
                      width: 32,
                      height: 32,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.d70),
                    Text(
                      AppStrings.totalS,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.d18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.d24),

              /// Info box
              Padding(
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
                  child: Row(
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
                  ),
                ),
              ),
              SizedBox(height: 12,),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: players
                                .map((player) => WinnerCard(player: player))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                  body: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                                  // height: 57,
                                  decoration: BoxDecoration(
                                    color: AppColors.sliderBackground,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Spacer(),
                                        customColumn(
                                          AppStrings.eight,
                                          AppStrings.day,
                                        ),
                                        const Spacer(),
                                        line(),
                                        const Spacer(),
                                        customColumn(
                                          AppStrings.twelve,
                                          AppStrings.hour,
                                        ),
                                        const Spacer(),
                                        line(),
                                        const Spacer(),
                                        customColumn(
                                          AppStrings.fif,
                                          AppStrings.minute,
                                        ),
                                        const Spacer(),
                                        line(),
                                        const Spacer(),
                                        customColumn(
                                          AppStrings.thi,
                                          AppStrings.second,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(
                            users.length,
                            (index) => HoverUserTile(user: users[index]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
