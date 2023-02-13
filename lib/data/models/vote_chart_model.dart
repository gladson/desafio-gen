import 'package:flutter/material.dart';

class VoteChartModel {
  VoteChartModel(
      {required this.voteAverage,
      required this.voteCount,
      required this.color});
  final String voteAverage;
  final int? voteCount;
  final Color? color;
}
