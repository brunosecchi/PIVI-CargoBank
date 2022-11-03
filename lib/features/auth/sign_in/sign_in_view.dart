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
            child: Padding(
              padding: EdgeInsets.all(30.30),
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const Text('Registro',
                      style:
                         TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Nome ou Razão Social')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('CPF ou CNPJ')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialMail,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('E-mail')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _credentialPhone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Telefone')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Senha')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
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
                          onPressed: () {},
                          child: const Text('Cadastrar')),
                      const SizedBox(
                          child: Padding(padding: EdgeInsets.all(40.0)),
                          width: 10),
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
