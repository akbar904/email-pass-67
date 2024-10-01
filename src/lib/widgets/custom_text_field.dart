
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
	final String? hintText;
	final String? initialText;
	final ValueChanged<String>? onChanged;
	final ValueChanged<String>? onSubmitted;

	const CustomTextField({
		Key? key,
		this.hintText,
		this.initialText,
		this.onChanged,
		this.onSubmitted,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final TextEditingController _controller = TextEditingController(text: initialText);

		return TextField(
			controller: _controller,
			decoration: InputDecoration(
				hintText: hintText,
			),
			onChanged: onChanged,
			onSubmitted: onSubmitted,
		);
	}
}
