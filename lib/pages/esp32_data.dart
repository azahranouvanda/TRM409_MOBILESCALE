import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ESP32Data with ChangeNotifier {
  static const String baseUrl = 'http://192.168.255.232'; // ESP32 IP address
  String _data = '';

  String get data => _data;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/data'));
      if (response.statusCode == 200) {
        _data = response.body;
        notifyListeners();
      } else {
        throw Exception(
            'Failed to load data with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to ESP32: $e');
    }
  }

  void fetchDataPeriodically() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        await fetchData();
      } catch (e) {
        timer.cancel(); // Optionally stop the timer if fetch fails
        rethrow;
      }
    });
  }
}
