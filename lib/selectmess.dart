import 'package:flutter/material.dart';
class selectmess extends StatefulWidget {
  const selectmess({Key? key}) : super(key: key);

  @override
  _selectmessState createState() => _selectmessState();
}

class _selectmessState extends State<selectmess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Select Mess',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(

      ),
    );
  }
}
