import 'package:flutter/material.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({Key? key}) : super(key: key);

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _list = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(30.10),
              key: _formkey,
              child: Column(
                children: <Widget>[
                  const Text('Novo Documento',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _list,
                    decoration:
                        const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Protocolo ou CT-E')),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.all(15.0)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          backgroundColor: const Color(0xFFF2796B),
                          onPressed: () {},
                          child: const Text('Enviar')),
                      const SizedBox(
                          child: Padding(padding: EdgeInsets.all(70.0)),
                          width: 70),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFF2796B)),
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
