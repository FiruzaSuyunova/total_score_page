
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_dimons.dart';
import '../../core/constants/app_strings.dart';

class InitialRow extends StatelessWidget {
  const InitialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
          const SizedBox(width: AppDimensions.d75),
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
    );
  }
}
