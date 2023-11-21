import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketRepositoryProvider =
    Provider<WebSocketRepository>((_) => WebSocketRepository());

class WebSocketRepository {
  WebSocketRepository();
  // final channel = WebSocketChannel.connect(Uri.parse('ws://100.64.1.40:8080/ws'));
  final channel = WebSocketChannel.connect(
      Uri.parse('wss://gamesample-ibiwnvw3aa-an.a.run.app/ws'));

  Stream<dynamic> getChannel() {
    return channel.stream;
  }

  void increment() {
    channel.sink.add('__increment__');
  }

  void decrement() {
    channel.sink.add('__decrement__');
  }

  void close() {
    channel.sink.close();
  }
}
