import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formRegister = GlobalKey<FormState>();
  final TextEditingController _credentialName = TextEditingController();
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _credentialMail = TextEditingController();
  final TextEditingController _credentialPhone = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  late String name;
  late String document;
  late String email;
  late String phone;
  late String password;

  void writeData() async {
    _formRegister.currentState?.save();
    var url = "https://cbank-dd3d6-default-rtdb.firebaseio.com/" + "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": name,
          "document": document,
          "email": email,
          "phone": phone,
          "password": password,
        }),
      );
      Navigator.pop(context);
    } catch (error) {
      throw error;
    }
  }

  Future<void> register(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((UserCredential value) {
      print(value.user.toString());
      writeData();
    }).catchError(
      (error) => print(error.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formRegister,
            child: Padding(
              padding: EdgeInsets.all(30.30),
              child: Column(
                children: <Widget>[
                  const Text('Registro',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialName,
                    onSaved: (value) {
                      name = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Nome ou Razão Social')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialController,
                    onSaved: (value) {
                      document = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('CPF ou CNPJ')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialMail,
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('E-mail')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialPhone,
                    onSaved: (value) {
                      phone = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Telefone')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    onSaved: (value) {
                      password = value!;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Senha')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _passwordConfirm,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Confirme sua Senha')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFF2796B)),
                          onPressed: () async {
                            await register(
                              _credentialMail.text.trim(),
                              _passwordController.text.trim(),
                            );
                          },
                          child: const Text('Cadastrar')),
                      const SizedBox(
                          width: 10,
                          child: Padding(padding: EdgeInsets.all(40.0))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFF2796B)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(Size size) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
      ),
      toolbarHeight: size.height * .25,
      backgroundColor: const Color(0xFFF2796B),
      automaticallyImplyLeading: false,
    );
  }
}
