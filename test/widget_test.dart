// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pishco_app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pishco_app/main.dart'; // جایگزینی your_app با نام پروژه‌ی شما
import 'package:pishco_app/NewRequestPage.dart'; // جایگزینی your_app با نام پروژه‌ی شما

void main() {
  testWidgets('NewRequestPage Submit Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // جایگزینی MyApp() با نام اصلی widget tree در main.dart

    // Navigate to the NewRequestPage
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter text into text fields
    await tester.enterText(find.byKey(ValueKey('nameTextField')), 'John Doe');
    await tester.enterText(find.byKey(ValueKey('phoneNumberTextField')), '123456789');
    await tester.enterText(find.byKey(ValueKey('addressTextField')), '123 Main St');
    await tester.enterText(find.byKey(ValueKey('requestTypeTextField')), 'Type 1');
    await tester.enterText(find.byKey(ValueKey('additionalNotesTextField')), 'Additional Notes');

    // Tap the submit button and wait for the response
    await tester.tap(find.byKey(ValueKey('submitButton')));
    await tester.pumpAndSettle();

    // Verify that the result is added to the list
    expect(find.text('درخواست جدید'), findsOneWidget);
  });
}
