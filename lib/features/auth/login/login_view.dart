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
          // margin: EdgeInsets.only(ad)
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(75.5),
              key: _formkey,
              child: Column( 
                
                
                children: <Widget>[
                  TextFormField(
                    
                    
                    
                    controller: _credentialController,
                    decoration: const InputDecoration(
                     
                        border: OutlineInputBorder(),
                        label: Text('CPF ou CNPJ')),
                  ),
                  SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Senha')),
                  ),
                  SizedBox(
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFF2796B)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/list');
                          },
                          child: const Text('Entrar')),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      SizedBox(
                          width: 70,
                          child: Divider(
                            height: 5,
                            color: Color(0xFFA39797),
                            thickness: 2,
                          )),
                      Text('Ou'),
                      SizedBox(
                          width: 70,
                          child: Divider(
                            height: 100,
                            color: Color(0xFFA39797),
                            thickness: 2,
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ))
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
      toolbarHeight: size.height * .3,
      backgroundColor: const Color(0xFFF2796B),
    );
  }
}
