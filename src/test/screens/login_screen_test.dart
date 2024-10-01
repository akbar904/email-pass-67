
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: LoginScreen(),
				),
			);

			expect(find.byType(CustomTextField), findsNWidgets(2)); // email and password fields
			expect(find.byType(CustomButton), findsOneWidget); // login button
			expect(find.widgetWithText(CustomButton, 'Login'), findsOneWidget);
		});
	});

	group('AuthCubit Logic Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthState.loading(), AuthState.success()] when login is successful',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [
				AuthState.loading(),
				AuthState.success(),
			],
		);

		blocTest<MockAuthCubit, AuthState>(
			'emits [AuthState.loading(), AuthState.failure()] when login fails',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [
				AuthState.loading(),
				AuthState.failure(),
			],
		);
	});
}
