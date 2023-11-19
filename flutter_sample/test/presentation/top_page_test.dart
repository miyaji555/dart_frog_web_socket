import 'package:flutter/material.dart';
import 'package:flutter_sample/constants/route_path.dart';
import 'package:flutter_sample/model/my_value.dart';
import 'package:flutter_sample/presentation/top/top_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('The first widget test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: TopPage(),
          ),
        ),
      );

      expect(find.text(kPageNameTop), findsOneWidget);
      expect(find.text(kPageNameNext), findsOneWidget);
    });
  });

  testWidgets('counter provider return error ', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            counterProvider.overrideWith((ref) => throw Exception()),
          ],
          child: const MaterialApp(
            home: TopPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('エラーが発生しました。'), findsOneWidget);
    });
  });

  testWidgets('counter provider return data ', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            counterProvider.overrideWith((ref) => Stream.value(1)),
          ],
          child: const MaterialApp(
            home: TopPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  });
}
