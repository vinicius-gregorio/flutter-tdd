import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages.dart';
import '../../components/components.dart';
import 'components/components.dart';

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
            showErrorMessage(context, error);
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
                child: Provider(
                  create: (_) => widget.presenter,
                  child: Form(
                      child: Column(
                    children: [
                      EmailInput(),
                      PasswordInput(),
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
                      ElevatedButton(
                          onPressed: null, child: Text('Entrar'.toUpperCase())),
                    ],
                  )),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
