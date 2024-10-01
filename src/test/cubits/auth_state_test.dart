
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/cubits/auth_state.dart';

// Define mock classes if necessary
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthState Tests', () {
		blocTest<AuthCubit, AuthState>(
			'initial state is AuthInitial',
			build: () => AuthCubit(),
			verify: (cubit) => expect(cubit.state, equals(AuthState.initial())),
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => AuthCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthState.loading(),
				AuthState.authenticated(User(id: '1', email: 'test@example.com')),
			],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthError] when login fails',
			build: () => AuthCubit(),
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [
				AuthState.loading(),
				AuthState.error('Login failed'),
			],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthLoading, AuthUnauthenticated] when logout is called',
			build: () => AuthCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [
				AuthState.loading(),
				AuthState.unauthenticated(),
			],
		);
	});
}
