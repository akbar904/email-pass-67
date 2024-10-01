
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/widgets/custom_text_field.dart';

void main() {
	group('CustomTextField Widget Tests', () {
		testWidgets('CustomTextField displays correct hint text', (WidgetTester tester) async {
			const hintText = 'Enter text';

			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(
					body: CustomTextField(hintText: hintText),
				),
			));

			expect(find.byType(TextField), findsOneWidget);
			expect(find.text(hintText), findsOneWidget);
		});

		testWidgets('CustomTextField displays correct initial text', (WidgetTester tester) async {
			const initialText = 'Initial text';

			await tester.pumpWidget(const MaterialApp(
				home: Scaffold(
					body: CustomTextField(initialText: initialText),
				),
			));

			final textField = tester.widget<TextField>(find.byType(TextField));
			expect(textField.controller!.text, equals(initialText));
		});

		testWidgets('CustomTextField calls onChanged callback', (WidgetTester tester) async {
			var changedText = '';

			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: CustomTextField(
						onChanged: (text) {
							changedText = text;
						},
					),
				),
			));

			await tester.enterText(find.byType(TextField), 'New text');
			expect(changedText, equals('New text'));
		});

		testWidgets('CustomTextField calls onSubmitted callback', (WidgetTester tester) async {
			var submittedText = '';

			await tester.pumpWidget(MaterialApp(
				home: Scaffold(
					body: CustomTextField(
						onSubmitted: (text) {
							submittedText = text;
						},
					),
				),
			));

			await tester.enterText(find.byType(TextField), 'Submit text');
			await tester.testTextInput.receiveAction(TextInputAction.done);

			expect(submittedText, equals('Submit text'));
		});
	});
}
