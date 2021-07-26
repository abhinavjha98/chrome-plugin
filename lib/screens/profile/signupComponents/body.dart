import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smsapp/components/alreadyAccountChecker.dart';
import 'package:smsapp/components/roundButton.dart';
import 'package:smsapp/components/roundedPasswordField.dart';
import 'package:smsapp/components/roundedTextField.dart';
import 'package:smsapp/screens/profile/login.dart';
import 'package:smsapp/screens/profile/signupComponents/background.dart';
import 'package:smsapp/screens/profile/signupComponents/orDivider.dart';
import 'package:smsapp/screens/profile/signupComponents/socialIcon.dart';
import 'package:smsapp/utils/http-client.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key key}) : super(key: key);

  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _username;
  String _email;
  String _password;
  String _mobile;

  _validateSignup(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await HttpClients()
          .register(_email, _username, _username, _password, _mobile);
      print(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: size.height * 0.35,
                    ),
                    RoundedInputField(
                      hintText: "Your  Name",
                      onChanged: (value) {},
                      onSubmit: (value) {
                        _name = value;
                      },
                    ),
                    RoundedInputField(
                      hintText: "Your Username",
                      onChanged: (value) {},
                      onSubmit: (value) {
                        _username = value;
                      },
                    ),
                    RoundedInputField(
                      icon: Icons.phone,
                      hintText: "Enter Mobile Number",
                      onChanged: (value) {},
                      onSubmit: (value) {
                        _mobile = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    RoundedInputField(
                      icon: Icons.email,
                      hintText: "Your Email id",
                      onChanged: (value) {},
                      onSubmit: (value) {
                        _email = value;
                      },
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      onSubmit: (value) {
                        _password = value;
                      },
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () {
                        _validateSignup(context);
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                )),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
