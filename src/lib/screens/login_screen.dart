
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';
import 'package:simple_cubit_app/widgets/custom_button.dart';
import 'package:simple_cubit_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

		final TextEditingController emailController = TextEditingController();
		final TextEditingController passwordController = TextEditingController();

		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						CustomTextField(
							controller: emailController,
							labelText: 'Email',
							obscureText: false,
						),
						SizedBox(height: 16.0),
						CustomTextField(
							controller: passwordController,
							labelText: 'Password',
							obscureText: true,
						),
						SizedBox(height: 16.0),
						BlocConsumer<AuthCubit, AuthState>(
							listener: (context, state) {
								if (state is AuthStateSuccess) {
									Navigator.of(context).pushReplacementNamed('/home');
								} else if (state is AuthStateFailure) {
									ScaffoldMessenger.of(context).showSnackBar(
										SnackBar(content: Text('Login Failed')),
									);
								}
							},
							builder: (context, state) {
								if (state is AuthStateLoading) {
									return CircularProgressIndicator();
								}

								return CustomButton(
									onPressed: () {
										authCubit.login(
											emailController.text,
											passwordController.text,
										);
									},
									text: 'Login',
								);
							},
						),
					],
				),
			),
		);
	}
}
