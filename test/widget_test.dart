import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:lab1/main.dart';

void main() {

  testWidgets('Product Manager UI Test',
          (WidgetTester tester) async {

        await tester.pumpWidget(const MyApp());

        expect(find.text('Product Manager'),
            findsOneWidget);

        expect(find.text('Add'),
            findsOneWidget);

        expect(find.text('Sort'),
            findsOneWidget);

        expect(find.text('Search'),
            findsOneWidget);
      });
}