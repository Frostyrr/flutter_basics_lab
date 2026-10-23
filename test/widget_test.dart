import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_basics_lab/activity1_profile_card.dart';
import 'package:flutter_basics_lab/activity2_water_tracker.dart';
import 'package:flutter_basics_lab/activity3_weather_layout.dart';
import 'package:flutter_basics_lab/activity4_cafe_menu.dart';
import 'package:flutter_basics_lab/activity5_theme_components.dart';

void main() {
  testWidgets('Profile shows personal details and phone', (tester) async {
    await tester.pumpWidget(const ProfileApp());
    expect(find.text('Marc Elson Rebato'), findsOneWidget);
    expect(
      find.text('Bachelor of Science in Information Technology'),
      findsOneWidget,
    );
    expect(find.text('marcelson.rebato@gmail.com'), findsOneWidget);
    expect(find.byIcon(Icons.phone), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('Water stays between zero and six, resets and logs builds', (
    tester,
  ) async {
    await tester.pumpWidget(const WaterTrackerApp());
    await tester.tap(find.byTooltip('Remove glass'));
    await tester.pump();
    expect(find.text('0 / 6 glasses'), findsOneWidget);
    for (int i = 0; i < 7; i++) {
      await tester.tap(find.byTooltip('Add glass'));
      await tester.pump();
    }
    expect(find.text('6 / 6 glasses'), findsOneWidget);
    expect(find.text('Six glasses complete! Stay hydrated!'), findsOneWidget);
    expect(
      tester
          .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator))
          .value,
      1,
    );
    await tester.tap(find.byTooltip('Remove glass'));
    await tester.pump();
    expect(find.text('5 / 6 glasses'), findsOneWidget);
    await tester.tap(find.text('Reset'));
    await tester.pump();
    expect(find.text('0 / 6 glasses'), findsOneWidget);
  });
  testWidgets('Weather has hometown and four equally sized statistics', (
    tester,
  ) async {
    await tester.pumpWidget(const WeatherApp());
    expect(find.text('Magallanes, Agusan del Norte'), findsOneWidget);
    expect(find.byType(StatBox), findsNWidgets(4));
    expect(find.text('Feels like'), findsOneWidget);
    final boxes = find.byType(StatBox);
    final width = tester.getSize(boxes.at(0)).width;
    for (int i = 1; i < 4; i++) {
      expect(tester.getSize(boxes.at(i)).width, closeTo(width, 0.01));
    }
    expect(tester.takeException(), isNull);
  });
  testWidgets('Cafe contains eight items and three best sellers', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(600, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const CafeApp());
    expect(menu.length, 8);
    expect(find.byType(MenuCard), findsNWidgets(8));
    expect(find.text('Ice Cream'), findsOneWidget);
    expect(find.text('Chocolate Cake'), findsOneWidget);
    expect(find.text('Best seller'), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });
  testWidgets('Settings toggles theme and buttons show feedback', (
    tester,
  ) async {
    await tester.pumpWidget(const ThemeDemoApp());
    expect(find.text('HTML'), findsOneWidget);
    expect(find.text('Theme color: Teal'), findsOneWidget);
    for (final pair in [
      ['Elevated', 'Elevated button pressed'],
      ['Outlined', 'Outlined button pressed'],
      ['Save', 'Saved!'],
    ]) {
      await tester.tap(find.text(pair[0]));
      await tester.pumpAndSettle();
      expect(find.text(pair[1]), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.dark,
    );
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.light,
    );
    expect(tester.takeException(), isNull);
  });
}
