import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 0.35,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColorDark
                    ]),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                      blurRadius: 4,
                      color: Colors.black),
                ],
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              child: Image(image: AssetImage('lib/ui/assets/logo/logo.png')),
            ),
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
                      onPressed: () {},
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
