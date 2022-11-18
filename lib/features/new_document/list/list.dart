import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';




class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);
  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _list = TextEditingController();
  final TextEditingController _listOne = TextEditingController();
  final TextEditingController _listTwo = TextEditingController();
  final TextEditingController _listThree = TextEditingController();

  // Future<void> makePostRequest() async {
  //   final url = Uri.parse('https://hml.ciot.gratis/api/v2/operacao/listar');
  //   final headers = {"Content-type": "application/json"};
  //   final json = '{"Token": "73eeaaf7c6f8423aa5348d65d5bae815","ColunaFiltro": "Protocolo","ColunaConsulta": ${consulta}';
  //   final response = await post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

  @override
  Widget build(BuildContext context) {
    // makePostRequest();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(30.50),
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const Text('Lista',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _list,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _listOne,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _listTwo,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _listThree,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('')),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          backgroundColor: const Color(0xFFF2796B),
                          onPressed: () {
                            Navigator.pushNamed(context, '/add_document');
                          },
                          child: const Icon(Icons.add)),
                      const SizedBox(
                          child: Padding(padding: EdgeInsets.all(70.0)),
                          width: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              maximumSize: Size(100, 40),
                              primary: Color(0xFFF2796B)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar')),
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
