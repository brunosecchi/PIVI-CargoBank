import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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


  // @override
  // void initState() {
  //   super.initState(
  //   );
  //   xdocument();
  // }

  // Future<void> xdocument() async {
  //   final String? uid = FirebaseAuth.instance.currentUser?.uid;
  //   if (uid != null) {
  //     Map<String, dynamic> map = {
  //       "document": document,
  //     };
  //     FirebaseDatabase feb = FirebaseDatabase.instance;
  //     final DatabaseReference databaseReference =
  //     FirebaseDatabase.instance.ref().child('document').child(uid);
  //     databaseReference.set(map);
  //   }
  // }
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
