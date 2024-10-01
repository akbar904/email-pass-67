
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		emit(AuthLoading());
		await Future.delayed(Duration(seconds: 1)); // Simulate network call
		if (email == 'test@example.com' && password == 'password123') {
			emit(AuthSuccess());
		} else {
			emit(AuthFailure());
		}
	}

	void logout() async {
		emit(AuthLoading());
		await Future.delayed(Duration(seconds: 1)); // Simulate network call
		emit(AuthLoggedOut());
	}
}
