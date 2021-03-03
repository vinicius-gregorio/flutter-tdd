import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(height: height),
            Text('Login'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    onChanged: presenter.validateEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    onChanged: presenter.validatePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    obscureText: true,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 24)),
                  TextButton(
                      onPressed: null,
                      child: Text('Criar Conta'.toUpperCase())),
                  // TextButton(
                  //     onPressed: null, child: Text('Entrar'.toUpperCase())),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
