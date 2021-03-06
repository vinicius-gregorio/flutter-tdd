import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  LoginPage(this.presenter);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Builder(builder: (context) {
        widget.presenter.isLoadingStream.listen((isLoading) {
          if (isLoading) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        });

        widget.presenter.mainErrorStream.listen((error) {
          if (error != null) {
            Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red[900],
                content: Text(
                  error,
                  textAlign: TextAlign.center,
                )));
          }
        });

        return SingleChildScrollView(
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
                        stream: widget.presenter.emailErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: widget.presenter.validateEmail,
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
                        stream: widget.presenter.passwordErrorStream,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: widget.presenter.validatePassword,
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
                        stream: widget.presenter.isFormValidStream,
                        builder: (context, snapshot) {
                          return TextButton(
                              onPressed: snapshot.data == true
                                  ? widget.presenter.auth
                                  : null,
                              child: Text('Criar Conta'.toUpperCase()));
                        }),
                    // TextButton(
                    //     onPressed: null, child: Text('Entrar'.toUpperCase())),
                  ],
                )),
              ),
            ],
          ),
        );
      }),
    );
  }
}
