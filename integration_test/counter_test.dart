import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //group('Check counter test', () {
  // testWidgets('tap on the floating action button, verify counter',
  //     (WidgetTester tester) async {
  //   app.main();

  //   await tester.pumpAndSettle();
  //   await Future.delayed(const Duration(seconds: 4));
  //   expect(find.text('0'), findsOneWidget);
  //   final Finder fab = find.byTooltip('Increment');
  //   await Future.delayed(const Duration(seconds: 4));
  //   await tester.tap(fab);
  //   await Future.delayed(const Duration(seconds: 4));
  //   await tester.pumpAndSettle();
  //   expect(find.text('1'), findsOneWidget);
  //   await Future.delayed(const Duration(seconds: 5));
  // });
  // });

  group('Test-course-list', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      
      await Future.delayed(const Duration(seconds: 5));
    });
  });
}
