import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_tdd/ui/pages/pages.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

void main() {
  LoginPresenter presenter;
  Future<void> loadPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();
    final loginPage = MaterialApp(home: LoginPage(presenter));
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

  testWidgets('Should call validate with correct values',
      (WidgetTester tester) async {
    await loadPage(tester);

    final email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email'), email);
    verify(presenter.validateEmail(email));

    final password = faker.internet.password();
    await tester.enterText(find.bySemanticsLabel('Senha'), password);
    verify(presenter.validatePassword(password));
  });
}
