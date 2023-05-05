import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Local Storage', () {
    testWidgets('Add task', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('Local Storage'), findsOneWidget);
      final Finder addItemBtn = find.byTooltip('add_item_btn');
      await tester.tap(addItemBtn);
      await Future.delayed(const Duration(seconds: 4));

      var textFieldTitle = find.byKey(const ValueKey('title'));
      await Future.delayed(const Duration(seconds: 2));
      expect(textFieldTitle, findsOneWidget);
      await tester.enterText(textFieldTitle, 'Integration test task');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      var textFieldDescription = find.byKey(const ValueKey('description'));
      await Future.delayed(const Duration(seconds: 2));
      expect(textFieldDescription, findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(
          textFieldDescription, 'Integration test task description');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      final Finder createNew = find.byType(ElevatedButton);
      await tester.tap(createNew);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 10));

      
    });
  });
}
