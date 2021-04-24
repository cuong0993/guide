import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_controller.dart';
import 'authentication_state.dart';

class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: Text(L10n.of(context)!.login,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () async {
                          await ref
                              .read(authenticationProvider.notifier)
                              .signInWithGoogle();
                          if (ref.read(authenticationProvider)
                              is AuthenticationStateAuthenticated) {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Image(
                                  image: AssetImage(
                                      'assets/images/img_google.png')),
                              const SizedBox(width: 8),
                              Text(L10n.of(context)!.button_sign_in_google,
                                  style: Theme.of(context).textTheme.subtitle1)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {
                          //TODO Facebook authentication
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Image(
                                  image: AssetImage(
                                      'assets/images/img_facebook.png')),
                              const SizedBox(width: 8),
                              Text(L10n.of(context)!.button_sign_in_facebook,
                                  style: Theme.of(context).textTheme.subtitle1)
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
