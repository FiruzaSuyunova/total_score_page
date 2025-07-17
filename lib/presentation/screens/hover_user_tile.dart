import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_score_page/core/constants/app_colors.dart';
import 'package:total_score_page/cubit/results_state.dart';

import '../../core/constants/app_dimons.dart';
import '../../cubit/results_cubit.dart';
import '../../core/entity/player_model.dart';

class HoverUserTile extends StatefulWidget {
  final PlayerModel user;
  final int order;
  const HoverUserTile({super.key, required this.user, required this.order});

  @override
  State<HoverUserTile> createState() => _HoverUserTileState();
}

class _HoverUserTileState extends State<HoverUserTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
          color: AppColors.sliderBackground,
        ),
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.order.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AppDimensions.d14,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: AppDimensions.d12),
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CachedNetworkImage(
                  imageUrl: user.imageUrl,
                  fit: BoxFit.cover,
                  height: 36,
                  width: 36,
                ),
              ),
            ],
          ),
          title: Text(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppDimensions.d14,
              color: AppColors.black,
              letterSpacing: 0,
            ),
          ),
          subtitle: Text(
            user.time.toString(),
            style: TextStyle(
              fontSize: AppDimensions.d14,
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            user.percent.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppDimensions.d18,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
