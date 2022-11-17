import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

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

  Future<void> xdocument(String document) async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      Map<String, dynamic> map = {
        "document": document,
      };
      FirebaseDatabase feb = FirebaseDatabase.instance;
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child('document').child(uid + document);
      databaseReference.set(map);
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
                                await xdocument(_list.text.trim());
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
