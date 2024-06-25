import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class IoTService with ChangeNotifier {
  String _data = '0';
  WebSocketChannel? _channel;

  String get data => _data;

  void connect(String url) {
    _channel = IOWebSocketChannel.connect(url);
    _channel!.stream.listen((message) {
      _data = message;
      notifyListeners();
    }, onError: (error) {}, onDone: () {});
  }

  void disconnect() {
    _channel?.sink.close();
  }
}
