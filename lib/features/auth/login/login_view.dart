import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _credentialController,
                  decoration: const InputDecoration(label: Text('CPF ou CNPJ')),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(label: Text('Senha')),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Entrar')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    SizedBox(
                        width: 60,
                        child: Divider(
                          height: 5,
                          color: Colors.grey,
                          thickness: 5,
                        )),
                    Text('Ou'),
                    SizedBox(
                        width: 60,
                        child: Divider(
                          height: 5,
                          color: Colors.grey,
                          thickness: 5,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Não é cliente?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-in');
                        },
                        child: const Text(
                          'Crie sua conta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ))
                  ],
                ),
              ],
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
      toolbarHeight: size.height * .3,
      backgroundColor: const Color(0xFFF2796B),
    );
  }
}
