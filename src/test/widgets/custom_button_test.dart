
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/widgets/custom_button.dart';

void main() {
	group('CustomButton Widget Tests', () {
		testWidgets('displays the correct text', (WidgetTester tester) async {
			// Arrange
			const buttonText = 'Click Me';

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: buttonText,
							onPressed: () {},
						),
					),
				),
			);

			// Assert
			expect(find.text(buttonText), findsOneWidget);
		});

		testWidgets('triggers onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			bool wasPressed = false;

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: 'Click Me',
							onPressed: () {
								wasPressed = true;
							},
						),
					),
				),
			);

			// Tap the button
			await tester.tap(find.byType(CustomButton));
			await tester.pump();

			// Assert
			expect(wasPressed, isTrue);
		});
	});
}
