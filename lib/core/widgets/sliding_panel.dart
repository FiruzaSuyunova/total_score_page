//
// import 'package:flutter/material.dart';
// import 'package:total_score_page/core/constants/app_colors.dart';
// import 'package:total_score_page/core/constants/app_strings.dart';
// import 'package:total_score_page/core/widgets/winner_card.dart' show WinnerCard;
// import 'package:total_score_page/data/dummy/winner_list.dart';
// import '../../core/constants/app_dimons.dart';
// import '../../data/dummy/player_list.dart';
// import '../models/player_model.dart';
// import 'custom_widgets.dart';
// import 'hover_user_tile.dart';
//
// class SlidingPanel extends StatelessWidget {
//   const SlidingPanel({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Stack(
//       children: [
//         Positioned(
//           top: screenHeight * 0.64,
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimensions.d24,),topRight: Radius.circular(AppDimensions.d24)),
//             ),
//             child: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) {
//                return
//                  [ SliverAppBar(expandedHeight: 250,
//                    flexibleSpace: FlexibleSpaceBar(background:    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.end,
//                      children: players
//                          .map((player) => WinnerCard(player: player))
//                          .toList(),
//                    ),),
//                  ) ];
//               },
//               body: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: users.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top:20,left: 15,bottom: 20,right: 15),
//                       child: Column(
//                         children: [
//                           const Text(
//                             AppStrings.ending,
//                             style: TextStyle(fontSize: AppDimensions.radius14,fontWeight: FontWeight.w500,color: AppColors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           Padding(
//                             padding: const EdgeInsets.only(top : 4,right: 8,left: 8),
//                             child: Container(
//                               height: 57,
//                               decoration: BoxDecoration(
//                                 color: AppColors.sliderBackground,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Spacer(),
//                                   /// Day
//                                   customColumn(AppStrings.eight, AppStrings.day),
//                                   const Spacer(),
//                                   line(),
//                                   const Spacer(),
//                                   /// Hour
//                                   customColumn(AppStrings.twelve, AppStrings.hour),
//                                   const Spacer(),
//                                   line(),
//                                   const Spacer(),
//                                   /// Minute
//                                   customColumn(AppStrings.fif, AppStrings.minute),
//                                   const Spacer(),
//                                   line(),
//                                   const Spacer(),
//                                   /// Second
//                                  customColumn(AppStrings.thi, AppStrings.second),
//                                   const Spacer(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // const SizedBox(height: 10),
//                         ],
//                       ),
//                     );
//                   }
//
//                   final user = users[index - 1];
//                   return HoverUserTile(user: user);
//                 },
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
