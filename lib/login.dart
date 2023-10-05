import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'elements/buttons.dart';
import 'elements/text_filed_form.dart';
import 'styles.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';

  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/logo-devlinks-large.svg'),
            const SizedBox(height: 52.0),
            Container(
              width: 476.0,
              height: 482.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login',
                          style: headingM,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Add your details below to get back into the app',
                          style: bodyM,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email adress',
                            style: bodyS,
                          ),
                          const SizedBox(height: 4.0),
                          const TextFieldForm(
                            iconLink: 'assets/images/icon-email.svg',
                            hintText: 'e.g. alex@email.com',
                            errorText: 'Can\'t be empty',
                            isError: false,
                          ),
                          const SizedBox(height: 24.0),
                          const Text(
                            'Password',
                            style: bodyS,
                          ),
                          const SizedBox(height: 4.0),
                          const TextFieldForm(
                            iconLink: 'assets/images/icon-password.svg',
                            hintText: 'Enter your password',
                            errorText: 'Can\'t be empty',
                            isError: false,
                          ),
                          const SizedBox(height: 24.0),
                          PrimaryButton(onPressed: () {}, title: 'Login'),
                          const SizedBox(height: 24.0),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: bodyM,
                                  ),
                                  TextSpan(
                                    text: 'Create account',
                                    style: bodyM.copyWith(color: lavander),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        Navigator.of(context).pushNamed('/');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
