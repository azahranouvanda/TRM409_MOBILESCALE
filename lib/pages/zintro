import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import halaman dashboard

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2363C4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 300),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'Great Scale',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'World number 1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(height: 0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                'mobile scale',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellow,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: SizedBox(height: 150),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 240, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
