import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vipratechuserauth/features/authentication/models/user_model.dart';
import 'package:vipratechuserauth/features/authentication/services/registration_provider.dart';
import 'package:vipratechuserauth/main.dart';
import 'package:vipratechuserauth/utils/validators.dart';
import 'package:vipratechuserauth/widgets/custom_icon_button.dart';
import 'package:vipratechuserauth/widgets/loader.dart';

import '../../../route/routenames.dart';
import '../../../widgets/custom_text_field.dart';
import "package:provider/src/consumer.dart";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController passWC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Registration"),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildNameField(),
              _buildEmailField(),
              _buildMobileField(),
              _buildPasswordField(),
              _buildSignUpButton(),
              _buildAlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildAlreadyHaveAccount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: " Log In",
                style: const TextStyle(color: primaryColor, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RouteNames.loginPage);
                  },
              )
            ],
            text: 'Already have an account?',
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Consumer<RegistrationProvider>(
      builder: (context, regProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPrimaryButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() == true) {
                  LoadingIndicator.show(context);
                  regProvider.userModel = UserModel(
                      emailC.text, mobileC.text, nameC.text, passWC.text);
                  if (await regProvider.signUp()) {}
                  if (!mounted) return;

                  LoadingIndicator.close(context);
                }
              },
              buttonText: "SIGN UP",
              buttonIcon: Icons.verified),
        );
      },
    );
  }

  CustomTextField _buildPasswordField() {
    return CustomTextField(
      controller: passWC,
      validator: PasswordValidator(),
      obscureText: true,
      prefixIcon: Icons.password,
      labelText: "Password",
    );
  }

  CustomTextField _buildMobileField() {
    return CustomTextField(
      textInputType: TextInputType.phone,
      validator: EmptyValidator(),
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      controller: mobileC,
      prefixIcon: Icons.phone,
      labelText: "Mobile",
    );
  }

  CustomTextField _buildEmailField() {
    return CustomTextField(
      validator: EmailValidator(),
      controller: emailC,
      prefixIcon: Icons.email,
      labelText: "Email",
    );
  }

  CustomTextField _buildNameField() {
    return CustomTextField(
      validator: EmptyValidator(),
      controller: nameC,
      prefixIcon: Icons.perm_identity,
      labelText: "Name",
    );
  }
}
