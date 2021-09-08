import 'package:flutter/material.dart';
class selectmess extends StatefulWidget {
  const selectmess({Key? key}) : super(key: key);

  @override
  _selectmessState createState() => _selectmessState();
}

class _selectmessState extends State<selectmess> {
  int mess = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Select Mess',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: RaisedButton(
              child: Text('mess 1'),
              onPressed: () {
                showAlertDialog(context);
              },
    )),
          Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blueGrey,
          child: RaisedButton(
            child: Text('mess 2'),
            onPressed: () {
              setState(() {
                mess += 1;
              });
              showAlertDialog(context);
            },
    )),
          Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blueGrey,
          child: RaisedButton(
            child: Text('mess 3'),
            onPressed: () {
              setState(() {
                mess += 2;
              });
              showAlertDialog(context);
             },
    )),

        ]

      ),
    );
  }
}
showAlertDialog(BuildContext context) {
  // Create button
  int mess = 1;
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Mess $mess was selected"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}