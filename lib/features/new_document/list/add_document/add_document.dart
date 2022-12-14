import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

import '../../model/ciot_model.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({Key? key}) : super(key: key);

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final _formDocument = GlobalKey<FormState>();
  final TextEditingController _list = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late String document;
  bool showimage = false;
  XFile? photo;
  String consulta = "";

  @override
  void initState() {
    super.initState();
  }


  Future<void> makePostRequest() async {
    final url = Uri.parse('https://hml.ciot.gratis/api/v2/operacao/listar');
    final headers = {"Content-type": "application/json"};
    final json =
        '{"Token": "73eeaaf7c6f8423aa5348d65d5bae815","ColunaFiltro": "Protocolo","ColunaConsulta": "${consulta}"}';
    final response = await post(url, headers: headers, body: json);
    log('//Body: ${response.body}');
    Map result = jsonDecode(response.body);
    bool sucesso = result['Sucesso'];
    if (sucesso == true) {
      print("Aprovado");
      saveData(
        ciot: consulta,
        success: true,
        data: "${response.body}",
      );
    } else {
      print("Rejeitado");
      saveData(
        ciot: consulta,
        success: false,
        data: "${response.body}",
      );
    }
  }

  void saveData({
    required String ciot,
    required bool success,
    required String data,
  }) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("uidNull");
    FirebaseDatabase db = FirebaseDatabase.instance;
    DatabaseReference ref = db
        .ref("document")
        .child(uid)
        .child("ciot")
        .child(DateTime.now().millisecondsSinceEpoch.toString());
    Map<String, String> map = <String, String>{
      "ciot": ciot,
      "success": success.toString(),
      "data": data,
    };
    ref.set(map);
  }

  void writeData() async {
    _formDocument.currentState?.save();
    var url = "https://cbank-dd3d6-default-rtdb.firebaseio.com/" + "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "document": document,
        }),
      );
      Navigator.pop(context);
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formDocument,
            child: Padding(
              padding: EdgeInsets.all(70.10),
              child: Column(
                children: <Widget>[
                  const Text('Novo Documento',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 40,
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  TextFormField(
                    controller: _list,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Protocolo ou CT-E')),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                          backgroundColor: const Color(0xFFF2796B),
                          onPressed: () async {
                            final XFile? aux = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              showimage = true;
                              photo = aux;
                            });
                          },
                          child: new Icon(Icons.add)),
                      showimage
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.file(File(photo!.path)),
                            )
                          : const SizedBox(
                              height: 150,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 40),
                                  maximumSize: Size(100, 40),
                                  primary: const Color(0xFFF2796B)),
                              onPressed: () async {
                                setState(() {
                                  consulta = _list.text;
                                });
                                makePostRequest();
                                Navigator.pop(context);
                              },
                              child: const Text('Enviar')),
                          const SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 40),
                                  maximumSize: Size(100, 40),
                                  primary: const Color(0xFFF2796B)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar')),
                        ],
                      ),
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
