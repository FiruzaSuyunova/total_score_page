import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimons.dart';
import '../models/winner_model.dart';

class WinnerCard extends StatelessWidget {
  final WinnerModel player;
  const WinnerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          width: 56,
          height: 56,
          child: Image.asset(player.imageUrl),
        ),
        const SizedBox(height: 4),
        Text(player.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 16)),
        Text(player.time, style: TextStyle(color: AppColors.white70,fontSize: 14,fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: player.weight,
              height: player.height,
              decoration: BoxDecoration(color: Color(player.colorCode)),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${player.rank}', style: const TextStyle(fontSize: AppDimensions.d44, fontWeight: FontWeight.w700, color: AppColors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 8,right: 12,bottom: 8,left: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(AppDimensions.opacity4),
                      borderRadius: BorderRadius.circular(AppDimensions.radius12),
                    ),
                    width: 53,
                    height: 37,
                    child: Center(
                      child: Text(
                        '${player.percent}%',
                        style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.white,fontSize: AppDimensions.d14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}