
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/models/user.dart';

void main() {
	group('User Model', () {
		test('should correctly serialize from JSON', () {
			// Arrange
			final json = {'id': '123', 'email': 'test@example.com'};
			
			// Act
			final user = User.fromJson(json);
			
			// Assert
			expect(user.id, '123');
			expect(user.email, 'test@example.com');
		});
		
		test('should correctly deserialize to JSON', () {
			// Arrange
			final user = User(id: '123', email: 'test@example.com');
			
			// Act
			final json = user.toJson();
			
			// Assert
			expect(json, {'id': '123', 'email': 'test@example.com'});
		});
		
		test('should correctly initialize User object', () {
			// Act
			final user = User(id: '123', email: 'test@example.com');
			
			// Assert
			expect(user.id, '123');
			expect(user.email, 'test@example.com');
		});
	});
}
