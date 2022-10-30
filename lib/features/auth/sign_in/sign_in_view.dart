import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _credentialName = TextEditingController();
  final TextEditingController _credentialController = TextEditingController();
  final TextEditingController _credentialMail = TextEditingController();
  final TextEditingController _credentialPhone = TextEditingController();
  final TextEditingController _credentialSelect = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

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
                const Text('Registro',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _credentialName,
                  decoration: const InputDecoration(
                      label: Text('Nome ou Razão Social')),
                ),
                TextFormField(
                  controller: _credentialController,
                  decoration: const InputDecoration(label: Text('CPF ou CNPJ')),
                ),
                TextFormField(
                  controller: _credentialMail,
                  decoration: const InputDecoration(label: Text('E-mail')),
                ),
                TextFormField(
                  controller: _credentialPhone,
                  decoration: const InputDecoration(label: Text('Telefone')),
                ),
                TextFormField(
                  controller: _credentialSelect,
                  decoration: const InputDecoration(label: Text('Selecione')),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(label: Text('Senha')),
                ),
                TextFormField(
                  controller: _passwordConfirm,
                  decoration:
                      const InputDecoration(label: Text('Confirme sua Senha')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('Cadastrar')),
                    SizedBox(width: 10),
                    ElevatedButton(
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
    );
  }

  AppBar _appBar(Size size) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
      ),
      toolbarHeight: size.height * .15,
      backgroundColor: const Color(0xFFF2796B),
      automaticallyImplyLeading: false,
    );
  }
}
