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
                const Text('Lista',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _list,
                  decoration: const InputDecoration(label: Text('')),
                ),
                TextFormField(
                  controller: _listOne,
                  decoration: const InputDecoration(label: Text('')),
                ),
                TextFormField(
                  controller: _listTwo,
                  decoration: const InputDecoration(label: Text('')),
                ),
                TextFormField(
                  controller: _listThree,
                  decoration: const InputDecoration(label: Text('')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        backgroundColor: const Color(0xFFF2796B),
                        onPressed: () {},
                        child: const Icon(Icons.add)),
                    const SizedBox(width: 10),
                    ElevatedButton( style: ElevatedButton.styleFrom(
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
