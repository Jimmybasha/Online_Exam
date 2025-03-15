import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../Core/Constants/app_colors.dart';

class CircularPercentIndicatorWidget extends StatelessWidget {
  final double percentage;

  const CircularPercentIndicatorWidget({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 6.0,
      animation: true,
      percent: percentage,
      center: Text("${(percentage * 100).toInt()}%"),
      circularStrokeCap: CircularStrokeCap.square,
      backgroundColor: Colors.red.withOpacity(0.2),
      progressColor: AppColors.kPrimaryColor,
    );
  }
}