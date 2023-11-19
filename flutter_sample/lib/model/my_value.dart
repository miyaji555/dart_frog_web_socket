import 'package:flutter_sample/repository/web_socket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_value.g.dart';

@riverpod
String city(CityRef ref) => 'London';

@riverpod
String country(CountryRef ref) => 'England';

// I don't know why this annotation is working
// https://stackoverflow.com/questions/76591540/how-to-correctly-override-in-tests-the-provider-generated-by-riverpod
@Riverpod(dependencies: [])
Stream<int> counter(CounterRef ref) {
  final webSocketRepository = ref.watch(webSocketRepositoryProvider);
  return webSocketRepository
      .getChannel()
      .map((event) => int.parse(event.toString()));
}

@riverpod
Future<void> increment(IncrementRef ref) async {
  ref.watch(webSocketRepositoryProvider).increment();
}

@riverpod
Future<void> decrement(DecrementRef ref) async {
  ref.watch(webSocketRepositoryProvider).decrement();
}

@riverpod
Future<void> close(CloseRef ref) async {
  ref.watch(webSocketRepositoryProvider).close();
}
