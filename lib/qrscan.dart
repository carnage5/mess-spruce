import 'package:flutter/material.dart';
class qrscan extends StatefulWidget {
  const qrscan({Key? key}) : super(key: key);

  @override
  _qrscanState createState() => _qrscanState();
}

class _qrscanState extends State<qrscan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
            'QR Scanner',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
    );
  }
}
