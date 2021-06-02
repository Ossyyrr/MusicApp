import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularLoader extends StatefulWidget {
  CircularLoader(
      {Key? key,
      required this.size,
      this.secondaryColor = Colors.white,
      this.primaryColor = Colors.white,
      this.backgroundColor = Colors.transparent,
      this.lapDuration = 1000,
      this.strokeWidth = 10.0})
      : super(key: key);
  final double size;
  final Color secondaryColor;
  final Color primaryColor;
  final Color backgroundColor;
  final int lapDuration;
  final double strokeWidth;
  @override
  _CircularLoaderState createState() => _CircularLoaderState();
}

class _CircularLoaderState extends State<CircularLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation? animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.lapDuration))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CirclePaint(
              secondaryColor: widget.backgroundColor,
              primaryColor: widget.backgroundColor,
              space: 0.2,
              strokeWidth: widget.strokeWidth),
          size: Size(widget.size, widget.size),
        ),
        RotationTransition(
          turns: Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(controller),
          child: CustomPaint(
            painter: CirclePaint(
                secondaryColor: widget.secondaryColor,
                primaryColor: widget.primaryColor,
                strokeWidth: widget.strokeWidth),
            size: Size(widget.size, widget.size),
          ),
        ),
      ],
    );
  }
}

class CirclePaint extends CustomPainter {
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;
  final double space;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  CirclePaint({
    this.secondaryColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.strokeWidth = 15,
    this.space = 3,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var centerPoint = size.height / 2;
    var paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [secondaryColor, primaryColor],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    var scapSize = strokeWidth * space;
    var scapToDegree = scapSize / centerPoint;
    var startAngle = _degreeToRad(270) + scapToDegree;
    var sweepAngle = _degreeToRad(360) - (2 * scapToDegree);
    canvas.drawArc(Offset(0.0, 0.0) & Size(size.width, size.width), startAngle,
        sweepAngle, false, paint..color = primaryColor);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}
