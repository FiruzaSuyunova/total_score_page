import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_score_page/cubit/results_state.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimons.dart';
import '../../cubit/results_cubit.dart';
import '../../core/entity/winner_model.dart';

class WinnerCard extends StatefulWidget {


  final double width;
  final double height;
  final int color;
  final WinnerModel player;


  const WinnerCard({super.key, required this.player,required this.width,required this.height,required this.color});

  @override
  State<WinnerCard> createState() => _WinnerCardState();
}

class _WinnerCardState extends State<WinnerCard> {

  String formatDuration(int seconds) {
    final d = Duration(seconds: seconds);
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///image
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CachedNetworkImage(
            imageUrl: widget.player.imageUrl,
            width: 56,
            height: 56,

          ),
        ),
        const SizedBox(height: 4),

        ///name
        Text(
          widget.player.name.replaceFirst(' ', '\n'),
          textAlign: TextAlign.center,

          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        ///time
        Text(
          formatDuration(widget.player.time),
          style: TextStyle(
            color: AppColors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),


        const SizedBox(height: 6),
        Stack(
          alignment: Alignment.center,
          children: [
            ///weight,height
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(color:Color(widget.color)),
            ),

            ///rank,percent
            Column(
              children: [
                /// rank
                Text(
                  '${widget.player.rank}',
                  style: const TextStyle(
                    fontSize: AppDimensions.d44,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 12,
                    bottom: 8,
                    left: 12,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(AppDimensions.opacity4),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius12,
                      ),
                    ),
                    width: 53,
                    height: 37,
                    /// percent
                    child: Center(
                      child: Text(
                        '${widget.player.percent}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          fontSize: AppDimensions.d14,
                        ),
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


