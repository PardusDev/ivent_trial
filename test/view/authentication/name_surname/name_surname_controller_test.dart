import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/view/authentication/name_surname/controller/name_surname_controller.dart';

void main() {
  group('NameSurnameController Tests', () {
    late NameSurnameController controller;

    setUp(() {
      Get.reset();
      Get.testMode = true;
      controller = Get.put(NameSurnameController());
    });

    tearDown(() {
      Get.reset();
    });

    test('should initialize with disabled continue button', () {
      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should have empty name surname controller initially', () {
      // Assert
      expect(controller.nameController.text, '');
    });

    test('should enable continue button for valid name surname', () {
      // Act
      controller.nameController.text = 'Ahmet Yılmaz';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should remain disabled for single word', () {
      // Act
      controller.nameController.text = 'Ahmet';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should remain disabled for short words', () {
      // Act
      controller.nameController.text = 'A B';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should enable for three word names', () {
      // Act
      controller.nameController.text = 'Ahmet Mehmet Yılmaz';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle empty string', () {
      // Act
      controller.nameController.text = '';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should handle whitespace only', () {
      // Act
      controller.nameController.text = '   ';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should handle mixed case input', () {
      // Act
      controller.nameController.text = 'aHmEt yIlMaZ';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle numbers in names', () {
      // Act
      controller.nameController.text = 'Ahmet2 Yilmaz3';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle special characters in names', () {
      // Act
      controller.nameController.text = 'Ahmet Yılmaz';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle very long names', () {
      // Act
      controller.nameController.text = 'Ahmet Mehmet Yılmaz Çelik Demir';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle single character words', () {
      // Act
      controller.nameController.text = 'A B C D';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should handle mixed valid and invalid words', () {
      // Act
      controller.nameController.text = 'Ahmet B C';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, false);
    });

    test('should handle multiple spaces between words', () {
      // Act
      controller.nameController.text = 'Ahmet    Yılmaz';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should handle leading and trailing spaces', () {
      // Act
      controller.nameController.text = '  Ahmet Yılmaz  ';
      controller.nameController.notifyListeners();

      // Assert
      expect(controller.canContinueRx.value, true);
    });

    test('should dispose controller properly', () {
      // Act
      controller.onClose();

      // Assert - Should not throw error
      expect(() => controller.nameController.text, returnsNormally);
    });
  });
}
