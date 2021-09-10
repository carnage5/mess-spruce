import 'package:flutter/material.dart';
class selectmess extends StatefulWidget {
  const selectmess({Key? key}) : super(key: key);

  @override
  _selectmessState createState() => _selectmessState();
}

class _selectmessState extends State<selectmess> {

  @override
  String? mess;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'Select Mess',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  child: Text('mess 1'),
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      mess='mess 1';
                    });
                    showAlertDialog(context,mess);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  child: Text('mess 2'),
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      mess ='mess 2';
                    });
                    showAlertDialog(context,mess);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                height: 50.0,
                child: RaisedButton(
                  child: Text('mess 3'),
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      mess ='mess 3';
                    });
                    showAlertDialog(context,mess);
                  },
                ),
              ),

            ]

        ),
      ),
    );
  }
}
showAlertDialog(BuildContext context,String? mess) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("$mess was selected"),
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