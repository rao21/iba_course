import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iba_course/main.dart';

void main() {
  //await loadAppFonts();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const App());

    // Verify that our counter starts at 0.
   
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  // testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
  //     (tester) async {
  //   final builder = DeviceBuilder()
  //     ..overrideDevicesForAllScenarios(devices: [
  //       Device.phone,
  //       Device.iphone11,
  //       Device.tabletPortrait,
  //       Device.tabletLandscape,
  //     ])
  //     ..addScenario(
  //       widget: App(),
  //       name: 'default page',
  //     );
  // ..addScenario(
  //   widget: App(),
  //   name: 'tap once',
  //   onCreate: (scenarioWidgetKey) async {
  //     final finder = find.descendant(
  //       of: find.byKey(scenarioWidgetKey),
  //       matching: find.byIcon(Icons.add),
  //     );
  //     expect(finder, findsOneWidget);
  //     await tester.tap(finder);
  //   },
  // )
  // ..addScenario(
  //   widget: App(),
  //   name: 'tap five times',
  //   onCreate: (scenarioWidgetKey) async {
  //     final finder = find.descendant(
  //       of: find.byKey(scenarioWidgetKey),
  //       matching: find.byIcon(Icons.add),
  //     );
  //     expect(finder, findsOneWidget);

  //     await tester.tap(finder);
  //     await tester.tap(finder);
  //     await tester.tap(finder);
  //     await tester.tap(finder);
  //     await tester.tap(finder);
  //   },
  // );

  //   await tester.pumpDeviceBuilder(
  //     builder,
  //     wrapper: materialAppWrapper(
  //       theme: ThemeData.light(),
  //       platform: TargetPlatform.android,
  //     ),
  //   );

  //   await screenMatchesGolden(tester, 'course_list');
  // });
}
