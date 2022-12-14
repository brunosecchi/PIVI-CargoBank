import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:pii6/features/new_document/model/list_item_model.dart';

class ListFromDb extends StatefulWidget {
  const ListFromDb({Key? key}) : super(key: key);

  @override
  State<ListFromDb> createState() => _ListFromDbState();
}

class _ListFromDbState extends State<ListFromDb> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _list = TextEditingController();
  final TextEditingController _listOne = TextEditingController();
  final TextEditingController _listTwo = TextEditingController();
  final TextEditingController _listThree = TextEditingController();

  final ListModel _model = ListModel();

  // Future<void> makePostRequest() async {
  //   final url = Uri.parse('https://hml.ciot.gratis/api/v2/operacao/listar');
  //   final headers = {"Content-type": "application/json"};
  //   final json = '{"Token": "73eeaaf7c6f8423aa5348d65d5bae815","ColunaFiltro": "Protocolo","ColunaConsulta": ${consulta}';
  //   final response = await post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');
  // }

  @override
  void initState() {
    super.initState();
    loadList();
  }

  void loadList() {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("uidNull");
    FirebaseDatabase db = FirebaseDatabase.instance;

    DatabaseReference ref = db.ref("document").child(uid).child("ciot");

    ref.onValue.listen(
      (event) {
        List<FirebaseItemModel> _aux =
            List<FirebaseItemModel>.empty(growable: true);

        for (var element in event.snapshot.children) {
          final Map<dynamic, dynamic> data =
              element.value as Map<dynamic, dynamic>;

          _aux.add(
            FirebaseItemModel(
              element.key,
              ItemFirebase(
                ciot: data["ciot"],
                data: data["data"],
                success: data["success"] == "true" ? true : false,
              ),
            ),
          );

          updateList(_aux);
        }
      },
    );
  }

  void updateList(List<FirebaseItemModel> aux) {
    setState(() {
      _model.firebaseItemModel = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Padding(padding: EdgeInsets.all(5.0)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: _model.firebaseItemModel != null
                        ? ListView.builder(
                            itemCount: _model.firebaseItemModel?.length,
                            itemBuilder: (context, index) {
                              final auxIndex = index+1;
                              return ListTile(
                                leading: Text("$auxIndex",),
                                  title: Text(_model.firebaseItemModel?[index]
                                          .itemFirebase.ciot ??
                                      'Erro ao carregar dados'),
                                  subtitle: _model.firebaseItemModel?[index]
                                              .itemFirebase.success ??
                                          false
                                      ? const Text('Aceito',style: TextStyle(color: Colors.green),)
                                      : const Text('Rejeitado, consulte a administra????o.',style: TextStyle(color: Colors.red)));
                            },
                          )
                        : const Center(
                            child: Text("Nenhuma info"),
                          ),
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
                            loadList();
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
