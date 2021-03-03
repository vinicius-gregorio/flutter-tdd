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
                  StreamBuilder<String>(
                      stream: presenter.emailErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: presenter.validateEmail,
                          decoration: InputDecoration(
                            errorText: snapshot.data?.isEmpty == true
                                ? null
                                : snapshot.data,
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        );
                      }),
                  StreamBuilder<String>(
                      stream: presenter.passwordErrorStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: presenter.validatePassword,
                          decoration: InputDecoration(
                            errorText: snapshot.data?.isEmpty == true
                                ? null
                                : snapshot.data,
                            labelText: 'Senha',
                            icon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          obscureText: true,
                        );
                      }),
                  Padding(padding: EdgeInsets.symmetric(vertical: 24)),
                  StreamBuilder<bool>(
                      stream: presenter.isFormValidStream,
                      builder: (context, snapshot) {
                        return TextButton(
                            onPressed: snapshot.data == true ? () {} : null,
                            child: Text('Criar Conta'.toUpperCase()));
                      }),
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
