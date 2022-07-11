import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:vipratechuserauth/features/authentication/services/login_provider.dart';
import 'package:provider/src/consumer.dart';
import 'package:vipratechuserauth/main.dart';
import 'package:vipratechuserauth/utils/sizeconstants.dart';
import 'package:vipratechuserauth/utils/validators.dart';
import 'package:vipratechuserauth/widgets/loader.dart';

import '../../../route/routenames.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildEmailField(loginProvider),
                  _buildPasswordFiled(loginProvider),
                  verticalWhiteSpace(20),
                  if (loginProvider.hasLogInFailed)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Please provide valid credentials",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  _buildLoginButton(context, loginProvider),
                  verticalWhiteSpace(20),
                  _buildDontHaveAccount(
                    onPressedSignUp: () => Navigator.pushNamed(
                        context, RouteNames.registrationScreen),
                  )
                ],
              ),
            ),
          );
        },
      );

  Center _buildDontHaveAccount({Function()? onPressedSignUp}) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: ' Sign up',
              style: const TextStyle(color: primaryColor, fontSize: 18),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (onPressedSignUp != null) {
                    onPressedSignUp();
                  }
                },
            )
          ],
          text: 'Don\'t have an account ?',
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginProvider loginProvider) {
    return CustomPrimaryButton(
      buttonText: "LOGIN",
      buttonIcon: Icons.login,
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          LoadingIndicator.show(context);
          if (await loginProvider.login(
              email: email.text, password: password.text)) {
            LoadingIndicator.close(context);
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.summaryScreen, (Route<dynamic> route) => false);
          } else {
            loginProvider.isInvalidCredential = true;
            LoadingIndicator.close(context);
          }
        }

        // if (!mounted) {
        //   return;
        // }
        // LoadingIndicator.close(context);
      },
    );
  }

  CustomTextField _buildPasswordFiled(LoginProvider loginProvider) {
    return CustomTextField(
      onChanged: (val) {
        loginProvider.isInvalidCredential = false;
      },
      controller: password,
      validator: EmptyValidator(),
      prefixIcon: Icons.password,
      obscureText: true,
      labelText: "Password",
    );
  }

  CustomTextField _buildEmailField(LoginProvider loginProvider) {
    return CustomTextField(
      onChanged: (val) {
        loginProvider.isInvalidCredential = false;
      },
      validator: EmailValidator(),
      controller: email,
      prefixIcon: Icons.verified,
      labelText: "Email/Phone",
    );
  }
}
