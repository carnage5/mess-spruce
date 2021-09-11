
import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  TextEditingController payment = new TextEditingController();
  int money=4500;
  int check=0;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    payment.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://previews.123rf.com/images/paitoonpati/paitoonpati1709/paitoonpati170900135/86156468-seamless-pattern-background-food-and-ingredient-kids-hand-drawing-set-illustration-isolated-on-white.jpg"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.orange[100],
              child: Text('Balance: ₹ $money',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.red[900],
              ),
              ),
            ),
              SizedBox(
                height: 40.0,
              ),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: TextField(
                 controller:payment,
                 keyboardType: TextInputType.number,

                 decoration: InputDecoration(
                   fillColor: Colors.orange[100],
                   filled: true,
                   border: UnderlineInputBorder(),
                   hintText: 'Enter in ₹',
                 ),
               ),
             ),
            SizedBox(
              height: 50.0,

            ),
            ButtonTheme(
              height: 50.0,
              minWidth: 100.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: (){
                  if(int.parse(payment.text)>money)
                    showAlertDialog1(context);
                  else {
                    showAlertDialog(context,int.parse(payment.text));
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        money = money - int.parse(payment.text);
                      });
                    });
                  }
                },
                child: Text('pay'),
                color: Colors.orange,),
            )
          ],
        ),
      )
    );
  }
}

showAlertDialog(BuildContext context,int pay) {
  // Create button


  Widget confirmButton = FlatButton(
    child: Text("Confirm"),
    color: Colors.orange,
    onPressed: () {
      Navigator.of(context).pop();
      showAlertDialog2(context);
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    color: Colors.orange,
    onPressed: () {
      Navigator.of(context).pop();
      
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(

    title: Text("Alert"),
    content: Text("Pay ₹ $pay ?"),
    actions: [
      confirmButton,
      cancelButton,
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
showAlertDialog1(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("Okay"),
    color: Colors.orange,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Warning"),
    content: Text("Entered amount too large"),
    actions: [
      okButton
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
showAlertDialog2(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("Okay"),
    color: Colors.green,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success",
    style: TextStyle(
        color: Colors.green,
    ),),
    content: Text(
        "Payment Successful",
    style: TextStyle(
      color: Colors.green,
    ),),
    actions: [
      okButton
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

