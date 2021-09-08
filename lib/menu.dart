
import 'package:flutter/material.dart';
class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            'Menu',
        style: TextStyle(
            color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonTheme(
              height: 50.0,
              child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/selectmess');
                  },
                  child: Text('Select Mess'),
                  color: Colors.red[900],
              ),
            ),
            SizedBox(
              height: 20.0,

            ),
            ButtonTheme(
              height: 50.0,
              child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/qrscan');
                  },
                  child: Text('Scan QR'),
                  color: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
