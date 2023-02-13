import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ClickHereWidget extends StatefulWidget {
  const ClickHereWidget({super.key, this.width = 75});

  final double width;

  @override
  State<ClickHereWidget> createState() => _ClickHereWidgetState();
}

class _ClickHereWidgetState extends State<ClickHereWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(milliseconds: 1000);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        "assets/lottie/click_in.json",
        width: widget.width,
      ),
    );
  }
}
