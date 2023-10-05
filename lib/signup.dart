import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'elements/buttons.dart';
import 'elements/text_filed_form.dart';
import 'styles.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';

  const SignUp({
    super.key,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/images/logo-devlinks-large.svg'),
                const SizedBox(height: 52.0),
                Container(
                  width: 476.0,
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
                              'Create an account',
                              style: headingM,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Let\'s get you started sharing your links!',
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
                                'Email address',
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
                                'Create password',
                                style: bodyS,
                              ),
                              const SizedBox(height: 4.0),
                              const TextFieldForm(
                                iconLink: 'assets/images/icon-password.svg',
                                hintText: 'At least 8 characters',
                                errorText: 'Can\'t be empty',
                                isError: false,
                              ),
                              const SizedBox(height: 24.0),
                              const Text(
                                'Confirm password',
                                style: bodyS,
                              ),
                              const SizedBox(height: 4.0),
                              const TextFieldForm(
                                iconLink: 'assets/images/icon-password.svg',
                                hintText: 'At least 8 characters',
                                errorText: 'Can\'t be empty',
                                isError: false,
                              ),
                              const SizedBox(height: 24.0),
                              const Text('Password must contain at least 8 characters', style: bodyS),
                              const SizedBox(height: 24.0),
                              PrimaryButton(onPressed: () {}, title: 'SignUp'),
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
        ),
      ),
    );
  }
}
