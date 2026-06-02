import 'package:flutter_test/flutter_test.dart';

import 'package:btthmobilebuoi3/widgets/about_me_widget.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('AboutMeWidget renders a text field', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController(text: 'Hello');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AboutMeWidget(controller: controller),
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);

    controller.dispose();
  });
}
