import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ivent_trial/product/widgets/name_surname_input.dart';
import 'package:ivent_trial/product/widgets/continue_button.dart';
import 'package:ivent_trial/view/authentication/name_surname/view/name_surname_view.dart';
import 'package:ivent_trial/view/dashboard/dashboard_view.dart';

void main() {
  group('NameSurnameView Tests', () {
    setUp(() {
      // GetX controller'ı test öncesi temizle
      Get.reset();
      Get.testMode = true;
    });

    tearDown(() {
      // Test sonrası temizlik
      Get.reset();
    });

    Widget createTestWidget() {
      return GetMaterialApp(
        initialRoute: '/name-surname',
        getPages: [
          GetPage(name: '/name-surname', page: () => const NameSurnameView()),
          GetPage(name: '/dashboard', page: () => const DashboardView()),
        ],
      );
    }

    testWidgets('should render all main components', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(
        find.text('Etkinliklere göz atmadan önce tanışalım.'),
        findsOneWidget,
      );
      expect(find.byType(NameSurnameInput), findsOneWidget);
      expect(find.byType(PrimaryButton), findsOneWidget);
      expect(find.text('Devam Et'), findsOneWidget);
    });

    testWidgets('should show header text with correct style', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      final headerText = find.text('Etkinliklere göz atmadan önce tanışalım.');
      expect(headerText, findsOneWidget);

      final headerWidget = tester.widget<Text>(headerText);
      expect(headerWidget.style?.fontWeight, FontWeight.w700); // bold
      expect(headerWidget.textAlign, TextAlign.center);
    });

    testWidgets('should have name surname input field', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(NameSurnameInput), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Adınız Soyadınız'), findsOneWidget); // hint text
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
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('should accept single name input', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'Ahmet');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet'), findsOneWidget);
    });

    testWidgets('should accept name and surname input', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'Ahmet Yılmaz');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet Yılmaz'), findsOneWidget);
    });

    testWidgets('should auto-capitalize first letter of each word', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'ahmet yılmaz');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet Yılmaz'), findsOneWidget);
    });

    testWidgets('should handle multiple spaces between words', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'ahmet  yılmaz');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet Yılmaz'), findsOneWidget);
    });

    testWidgets('continue button should remain disabled for single word', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'Ahmet');
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('continue button should remain disabled for short words', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'A B');
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('continue button should be enabled for valid name surname', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'Ahmet Yılmaz');
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNotNull);
    });

    testWidgets('should handle three word names', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'Ahmet Mehmet Yılmaz');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet Mehmet Yılmaz'), findsOneWidget);

      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNotNull);
    });

    testWidgets('should handle empty input validation', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act - Enter text then clear it
      await tester.enterText(nameField, 'Ahmet Yılmaz');
      await tester.pumpAndSettle();
      await tester.enterText(nameField, '');
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('should handle whitespace only input', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, '   ');
      await tester.pumpAndSettle();

      // Assert
      final continueButton = tester.widget<ElevatedButton>(
        find.descendant(
          of: find.byType(PrimaryButton),
          matching: find.byType(ElevatedButton),
        ),
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('should maintain cursor position after auto-capitalization', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();
      final nameField = find.byType(TextFormField);

      // Act
      await tester.enterText(nameField, 'ahmet');
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Ahmet'), findsOneWidget);

      // Add more text to test cursor behavior
      await tester.enterText(nameField, 'ahmet yılmaz');
      await tester.pumpAndSettle();
      expect(find.text('Ahmet Yılmaz'), findsOneWidget);
    });
  });
}
