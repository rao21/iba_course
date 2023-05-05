import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Add Task sql lite', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 4));
      expect(find.text('Local Storage'), findsOneWidget);
      final Finder fab = find.byTooltip('add_item_btn');
      await tester.tap(fab);
      await Future.delayed(const Duration(seconds: 4));

      var textFieldTitle = find.byKey(const ValueKey('title'));
      await Future.delayed(const Duration(seconds: 2));
      expect(textFieldTitle, findsOneWidget);
      await tester.enterText(textFieldTitle, 'Integration test task');
      await Future.delayed(const Duration(seconds: 2));

      var textFieldDescription = find.byKey(const ValueKey('description'));
      await Future.delayed(const Duration(seconds: 2));
      expect(textFieldDescription, findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(
          textFieldDescription, 'Integration test task description');

      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      final Finder add = find.byType(ElevatedButton);
      await tester.tap(add);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 10));
    });
  });
}
