import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/service/services_api.dart';
import 'package:labinfoapp/ui/agendamento/mainTabAgendamentos_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nomeController;
  TextEditingController _titulodController;
  TextEditingController _confirmPasswordController;
  bool isLoading;
  bool showPass;
  String curso;
  ApiService api;

  @override
  void initState() {
    api = ApiService();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nomeController = TextEditingController();
    _titulodController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    isLoading = false;
    showPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4EB2EA),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 80,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF4EB2EA),
            child: Center(
              child: Material(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Cadastro de\n Professores',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF045A8A),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        CustomTextField(
                          hint: 'Nome',
                          textInputType: TextInputType.text,
                          controller: _nomeController,
                          enabled: !isLoading,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        CustomTextField(
                          hint: 'Título',
                          textInputType: TextInputType.text,
                          controller: _titulodController,
                          onChanged: null,
                          enabled: !isLoading,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        CustomTextField(
                          hint: 'E-mail',
                          textInputType: TextInputType.emailAddress,
                          controller: _emailController,
                          onChanged: null,
                          enabled: !isLoading,
                        ),
                        SizedBox(
                          height: 13,
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
                        SizedBox(
                          height: 13,
                        ),
                        CustomTextField(
                            hint: 'Confirmar senha',
                            textInputType: TextInputType.emailAddress,
                            controller: _confirmPasswordController,
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
                        SizedBox(
                          height: 13,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
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
                                      'Salvar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                              onPressed: () async {
                                if (_nomeController.text.isNotEmpty &&
                                    _emailController.text.isNotEmpty &&
                                    _passwordController.text.isNotEmpty &&
                                    (_passwordController.text ==
                                        _confirmPasswordController.text)) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var resultado = await api.register(
                                      _emailController.text,
                                      _passwordController.text,
                                      _titulodController.text,
                                      _nomeController.text);

                                  if (resultado == 200) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainTabAgendamentos()));
                                  }
                                }
                                setState(() {
                                  isLoading = false;
                                });
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
          ),
        ),
      ),
    );
  }
}
