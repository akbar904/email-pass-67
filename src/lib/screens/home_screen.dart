
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';
import 'package:com.example.simple_cubit_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final authCubit = context.read<AuthCubit>();

		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
			),
			body: Center(
				child: CustomButton(
					text: 'Logout',
					onPressed: () => authCubit.logout(),
				),
			),
		);
	}
}
