import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'router/router.dart';

class RequireLoginPage extends StatelessWidget {
  const RequireLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RequireLoginWidget());
  }
}

class RequireLoginWidget extends StatelessWidget {
  const RequireLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(L10n.of(context)!.require_login),
                  const SizedBox(height: 8),
                  TextButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(const AuthenticationRoute());
                      },
                      child: Text(L10n.of(context)!.login),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.greenAccent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ))
                ])));
  }
}
