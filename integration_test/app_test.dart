// This is a basic Flutter integration test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:loc_sensors/main.dart';

void main() {
  group('Testing App Performance Tests', ()
  {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test 1', (tester) async {
      await tester.pumpWidget(Sensors());


        await tester.pumpAndSettle();
      });

    testWidgets('Test 2', (tester) async {
      await tester.pumpWidget(Sensors());

      await tester.pumpAndSettle();

    });
  });
}