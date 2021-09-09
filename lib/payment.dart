import 'package:flutter/material.dart';
class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  TextEditingController payment = new TextEditingController();
  int money=4500;
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
        backgroundColor: Colors.red[900],
        title: Text(
          'food court',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Remaing amount is:'),
          Text('$money',style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller:payment,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter in rupees',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 150.0),
            child: ButtonTheme(
              height: 50.0,
              child: FlatButton(
                onPressed: (){
                      setState(() {
                          money=money-int.parse(payment.text);
                      });

                },
                child: Text('pay'),
                color: Colors.red[900],),
            ),
          )
        ],
      )
    );
  }
}
