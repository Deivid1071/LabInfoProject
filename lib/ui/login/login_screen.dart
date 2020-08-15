import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool isLoading;
  bool showPass;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    isLoading = false;
    showPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4EB2EA),
        body: Center(
          child: Material(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color(0xFF045A8A),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    hint: 'E-mail',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: null,
                    enabled: !isLoading,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                      hint: 'Senha',
                      textInputType: TextInputType.emailAddress,
                      controller: _passwordController,
                      onChanged: null,
                      obscure: !showPass,
                      enabled: !isLoading,
                      suffix: IconButton(
                        icon: !showPass
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 150),
                    child: ButtonTheme(
                      height: 45,
                      minWidth: 100,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Color(0xFF80E66F),
                        child: isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Entrar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                        onPressed: () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
