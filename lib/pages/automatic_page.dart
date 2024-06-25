import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter
import 'package:tesonly/pages/dashboard_page.dart';
import 'package:tesonly/pages/result_page.dart';

class AutomaticPage extends StatelessWidget {
  const AutomaticPage({Key? key}) : super(key: key);

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
            const Text(
              'Great Scale',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 251, 252, 252),
              ),
            ),
            const Text(
              'Input kebutuhan timbang disini',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 45),
            // First Text Field for Data 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 250, // Set a specific width
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set white background color
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '   Jenis benda',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                      border: InputBorder.none, // Remove the border
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Second Text Field for Data 2 (Accept only integers)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 250, // Set a specific width
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set white background color
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: '   Berat yang diinginkan',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 75, 74, 74)),
                      border: InputBorder.none, // Remove the border
                    ),
                    style: const TextStyle(color: Colors.black),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 150,
              height: 150,
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
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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
