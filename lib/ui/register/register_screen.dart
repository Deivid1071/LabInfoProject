import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
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

  @override
  void initState() {
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
        backgroundColor: Color(0xFF4EB2EA),
        body: Center(
          child: Material(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
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
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30)),
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: curso != null ? curso : null,
                          hint: Text(
                            'Cursos                              ',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          items: <String>[
                            'Opção 1',
                            'Opção 2',
                            'Opção 3',
                            'Opção 4'
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              curso = value;
                            });
                          },
                        ),
                      ),
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
                          onPressed: () {
                            setState(() {
                              isLoading = !isLoading;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainTabAgendamentos()));
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
    );
  }
}
