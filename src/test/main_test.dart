
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/main.dart';

// Mock classes
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MainApp', () {
		testWidgets('renders MaterialApp', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());
			expect(find.byType(MaterialApp), findsOneWidget);
		});

		testWidgets('initial route is LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());
			expect(find.byType(LoginScreen), findsOneWidget);
		});

		testWidgets('routes include LoginScreen and HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());
			final navigatorFinder = find.byType(Navigator);
			final navigator = tester.widget<Navigator>(navigatorFinder);
			expect(navigator.onGenerateRoute(RouteSettings(name: '/')), isNotNull);
			expect(navigator.onGenerateRoute(RouteSettings(name: '/home')), isNotNull);
		});
	});
}
