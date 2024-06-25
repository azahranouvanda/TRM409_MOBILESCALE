import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_page.dart'; // Ensure this path is correct
import 'esp32_data.dart'; // Ensure this path is correct

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final double _maxValue = 100;
  final double _animationDurationInSeconds = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _animationDurationInSeconds.toInt()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: Consumer<ESP32Data>(
          builder: (context, esp32Data, child) {
            if (esp32Data.data.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              final double dataValue = double.tryParse(esp32Data.data) ?? 0;
              _animation =
                  Tween<double>(begin: 0, end: dataValue).animate(_controller);
              _controller.forward(from: 0);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Great Scale',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 252, 252),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Result',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return ScaleWithCircles(
                        value: _animation.value,
                        maxValue: _maxValue,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  AnimatedResultText(
                    animationController: _controller,
                    dataValue: dataValue,
                  ),
                  const SizedBox(height: 45),
                  Container(
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Berat yang ditimbang sesuai dengan berat yang ditetapkan.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
          },
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
    return Stack(
      children: [
        Container(
          width: 250,
          height: 250,
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
            painter: ScalePainter(
              value: value,
              maxValue: maxValue,
            ),
          ),
        ),
        Positioned(
          left: 35.5,
          top: 35.5,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 19, 84, 138),
                width: 8,
              ),
            ),
          ),
        ),
        Positioned(
          right: 60.5,
          bottom: 60.5,
          child: Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 41, 45, 92),
                width: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScalePainter extends CustomPainter {
  final double value;
  final double maxValue;

  ScalePainter({
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

class AnimatedResultText extends StatelessWidget {
  final AnimationController animationController;
  final double dataValue;

  const AnimatedResultText({
    Key? key,
    required this.animationController,
    required this.dataValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Text(
          'Your Result is ${dataValue.toStringAsFixed(2)} grams',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
