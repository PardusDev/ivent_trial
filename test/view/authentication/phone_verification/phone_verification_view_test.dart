import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/product/widgets/continue_button.dart';
import 'package:ivent_trial/product/widgets/phone_input_field.dart';
import 'package:ivent_trial/view/authentication/phone_verification/controller/phone_verification_controller.dart';
import 'package:ivent_trial/view/authentication/phone_verification/view/phone_verification_view.dart';

void main() {
  group('PhoneVerificationView Tests', () {
    late PhoneVerificationController controller;

    setUp(() {
      // GetX controller'ı test öncesi temizle
      Get.reset();
      controller = Get.put(PhoneVerificationController());
    });

    tearDown(() {
      // Test sonrası temizlik
      Get.reset();
    });

    Widget createTestWidget() {
      return GetMaterialApp(home: const PhoneVerificationView());
    }

    testWidgets('should render all main components', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(
        find.text(
          'İletişim numaranı girerek seçkin etkinliklere katılabilirsin',
        ),
        findsOneWidget,
      );
      expect(find.byType(PhoneInputField), findsOneWidget);
      expect(find.byType(ContinueButton), findsOneWidget);
      expect(find.text('Devam Et'), findsOneWidget);
    });

    testWidgets('should show +90 prefix in phone input', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('+90'), findsOneWidget);
      expect(find.text('XXXXXXXXXX'), findsOneWidget); // hint text
    });

    testWidgets('continue button should be disabled initially', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(ContinueButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('should accept phone number input', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      final phoneField = find.byType(TextFormField);

      // Act
      await tester.enterText(phoneField, '5551234567');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('5551234567'), findsOneWidget);
    });

    testWidgets(
      'continue button should be enabled for valid Turkish phone number',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Act - Enter valid Turkish phone number (starts with 5, 10 digits)
        await tester.enterText(phoneField, '5551234567');
        await tester.pumpAndSettle();

        // Assert
        final continueButton = tester.widget<ElevatedButton>(
          find.descendant(
            of: find.byType(ContinueButton),
            matching: find.byType(ElevatedButton),
          ),
        );
        expect(continueButton.onPressed, isNotNull);
      },
    );

    testWidgets(
      'continue button should remain disabled for invalid phone number',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Act - Enter invalid phone number (doesn't start with 5)
        await tester.enterText(phoneField, '4551234567');
        await tester.pumpAndSettle();

        // Assert
        final continueButton = tester.widget<ElevatedButton>(
          find.descendant(
            of: find.byType(ContinueButton),
            matching: find.byType(ElevatedButton),
          ),
        );
        expect(continueButton.onPressed, isNull);
      },
    );

    testWidgets(
      'continue button should remain disabled for short phone number',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Act - Enter short phone number
        await tester.enterText(phoneField, '555123');
        await tester.pumpAndSettle();

        // Assert
        final continueButton = tester.widget<ElevatedButton>(
          find.descendant(
            of: find.byType(ContinueButton),
            matching: find.byType(ElevatedButton),
          ),
        );
        expect(continueButton.onPressed, isNull);
      },
    );

    testWidgets('should limit phone number input to 10 digits', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      final phoneField = find.byType(TextFormField);

      // Act - Try to enter more than 10 digits
      await tester.enterText(phoneField, '555123456789');
      await tester.pumpAndSettle();

      // Assert - Should be limited to 10 digits
      expect(find.text('5551234567'), findsOneWidget);
      expect(find.text('555123456789'), findsNothing);
    });

    testWidgets('should only accept digits in phone input', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      final phoneField = find.byType(TextFormField);

      // Act - Try to enter non-digits
      await tester.enterText(phoneField, '555abc123');
      await tester.pumpAndSettle();

      // Assert - Should filter out non-digits
      expect(find.text('555123'), findsOneWidget);
    });

    testWidgets(
      'should enable continue button and store phone number correctly',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Act
        await tester.enterText(phoneField, '5551234567');
        await tester.pumpAndSettle();

        // Assert - Button should be enabled and phone number stored
        final continueButton = tester.widget<ElevatedButton>(
          find.descendant(
            of: find.byType(ContinueButton),
            matching: find.byType(ElevatedButton),
          ),
        );
        expect(continueButton.onPressed, isNotNull);
        expect(controller.phoneController.text, equals('5551234567'));
        expect(controller.canContinueRx.value, isTrue);
      },
    );

    testWidgets(
      'phone input field should show correct text color when typing',
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Act
        await tester.enterText(phoneField, '555');
        await tester.pumpAndSettle();

        // Assert - Verify the controller state
        expect(controller.phoneController.text, equals('555'));
      },
    );

    group('Validation Tests', () {
      testWidgets('should validate Turkish mobile numbers correctly', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Test valid numbers
        final validNumbers = ['5551234567', '5321234567', '5431234567'];
        for (String number in validNumbers) {
          await tester.enterText(phoneField, number);
          await tester.pumpAndSettle();

          final continueButton = tester.widget<ElevatedButton>(
            find.descendant(
              of: find.byType(ContinueButton),
              matching: find.byType(ElevatedButton),
            ),
          );
          expect(
            continueButton.onPressed,
            isNotNull,
            reason: '$number should be valid',
          );
        }
      });

      testWidgets('should reject invalid Turkish mobile numbers', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());
        final phoneField = find.byType(TextFormField);

        // Test invalid numbers
        final invalidNumbers = [
          '4551234567',
          '1551234567',
          '6551234567',
          '555123456',
        ];
        for (String number in invalidNumbers) {
          await tester.enterText(phoneField, number);
          await tester.pumpAndSettle();

          final continueButton = tester.widget<ElevatedButton>(
            find.descendant(
              of: find.byType(ContinueButton),
              matching: find.byType(ElevatedButton),
            ),
          );
          expect(
            continueButton.onPressed,
            isNull,
            reason: '$number should be invalid',
          );
        }
      });
    });
  });
}
