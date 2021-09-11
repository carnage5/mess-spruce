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
        backgroundColor: Colors.orange,
        title: Text(
          'Select Mess',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://previews.123rf.com/images/paitoonpati/paitoonpati1709/paitoonpati170900135/86156468-seamless-pattern-background-food-and-ingredient-kids-hand-drawing-set-illustration-isolated-on-white.jpg"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ButtonTheme(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text('mess 1'),
                    color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        mess='mess 1';
                      });

                      showAlertDialog(context,mess);

                    }
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text('mess 2'),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
      ),
    );
  }
}
showAlertDialog(BuildContext context,String? mess) {
  // Create button
  Widget okButton = FlatButton(
    color: Colors.orange,
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