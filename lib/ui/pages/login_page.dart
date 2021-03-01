import 'package:flutter/material.dart';

import '../components/components.dart';

class LoginPage extends StatelessWidget {
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
                      onPressed: () {
                        print('account');
                      },
                      child: Text('Criar Conta'.toUpperCase())),
                  TextButton(
                      onPressed: () {}, child: Text('Entrar'.toUpperCase())),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
