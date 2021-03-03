import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tdd/ui/pages/pages.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    final loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage);
  }

  testWidgets('Should load with correct initial state',
      (WidgetTester tester) async {
    await loadPage(tester);
    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text)); //
    // Como se fosse uma Query, retorna uma lista de varios Text.
    //Espera-se encontrar so 1, pois o TextFormField tera sempre um label.
    //Se ele tiver mais de um label, eh por que ele tem um erro.(ErrorText)
    expect(emailTextChildren, findsOneWidget,
        reason:
            'When a TextFormField has one text child, means it has no errors. Since one of the childs is always the hint/label text');

    final passwordTextChildren = find.descendant(
        of: find.bySemanticsLabel('Senha'), matching: find.byType(Text)); //
    // Como se fosse uma Query, retorna uma lista de varios Text.
    //Espera-se encontrar so 1, pois o TextFormField tera sempre um label.
    //Se ele tiver mais de um label, eh por que ele tem um erro.(ErrorText)
    expect(passwordTextChildren, findsOneWidget,
        reason:
            'When a TextFormField has one text child, means it has no errors. Since one of the childs is always the hint/label text');

    final button = tester.widget<TextButton>(find.byType(TextButton));
    expect(button.onPressed, null);
  });
}
