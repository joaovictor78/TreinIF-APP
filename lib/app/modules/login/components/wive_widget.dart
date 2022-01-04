import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'clipper_widget.dart';

class WaveWidget extends StatefulWidget {
  final Size? size;
  final double? yOffset;
  final Color? color;

  WaveWidget({
    this.size,
    this.yOffset,
    this.color,
  });

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            wavePoints.clear();

            final double waveSpeed = animationController!.value * 3;
            final double fullSphere = animationController!.value * Math.pi * 2;
            final double normalizer = Math.cos(fullSphere);
            final double waveWidth = Math.pi / 240;
            final double waveHeight = 20;

            for (int i = 0; i <= widget.size!.width.toInt() + 4; ++i) {
              double calc = Math.sin((waveSpeed - i) * waveWidth);
              wavePoints.add(
                Offset(
                  i.toDouble(), //X
                  calc * waveHeight * normalizer + widget.yOffset!, //Y
                ),
              );
            }
          });

    animationController!.repeat();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoints,
          ),
          child: Container(
            width: double.infinity,
            height: widget.size!.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}