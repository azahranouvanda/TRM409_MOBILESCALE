import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tesonly/pages/dashboard_page.dart';
import 'result_page.dart';

class StartScalePage extends StatelessWidget {
  const StartScalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2363C4),
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(),
              ),
            );
          },
          child: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Add space here
            const Text(
              'Great Scale',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 251, 252, 252),
              ),
            ),
            const SizedBox(height: 10), // Add space here
            const Text(
              'Pencet start untuk menimbang',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50), // Add space here
            const ScaleWithCircles(
              value: 0.0, // UBAH ANGKA TENGAH DISINI (VALUE)
              maxValue: 100, // Maximum value
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150, // Adjust button width
              height: 150, // Adjust button height
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ResultPage();
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD701),
                  shape: const CircleBorder(),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    color: Color(0xFF13548A), // Change text color to blue
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}

class ScaleWithCircles extends StatelessWidget {
  final double value;
  final double maxValue;

  const ScaleWithCircles({
    Key? key,
    required this.value,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 250, // Diameter of the circle
        height: 250, // Diameter of the circle
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 215, 1),
              Colors.blue.shade700,
            ],
          ),
        ),
        child: Center(
          child: Text(
            '${value.toInt()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: CustomPaint(
          painter: _ScalePainter(
            value: value,
            maxValue: maxValue,
          ),
        ),
      ),
      Positioned(
        // circle no 1
        left: 35.5,
        top: 35.5,
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 19, 84, 138),
              width: 8, // Adjust the width of the outline as needed
            ),
          ),
        ),
      ),
      Positioned(
        //circle no 2
        right: 60.5,
        bottom: 60.5,
        child: Container(
          width: 125,
          height: 125,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 41, 45, 92), // Outline color
              width: 25, // Adjust the width of the outline as needed
            ),
          ),
        ),
      ),
    ]);
  }
}

class _ScalePainter extends CustomPainter {
  final double value;
  final double maxValue;

  _ScalePainter({
    required this.value,
    required this.maxValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    const strokeWidth = 10.0;
    const startAngle = -0.5 * pi;
    final sweepAngle = value / maxValue * 2 * pi;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue.shade200,
          Colors.blue.shade700,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
