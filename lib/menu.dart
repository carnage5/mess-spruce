
import 'package:flutter/material.dart';
import 'package:mess/qrscan.dart';

class menu extends StatelessWidget {
  String? var1;
  //const menu({Key? key}) : super(key: key);
  menu({this.var1});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            'Menu',
        style: TextStyle(
            color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Colors.orange ,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image(
                  image: NetworkImage('https://raw.githubusercontent.com/carnage5/mess-spruce/master/lib/logo.jpeg'),
                height: 300.0,

              ),
              SizedBox(
                height: 50.0,
              ),
              ButtonTheme(
                height: 50.0,
                child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/selectmess');
                    },
                    child: Text('Select Mess'),
                    color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 20.0,

              ),
              ButtonTheme(
                height: 50.0,
                child: FlatButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context){
                            return qrscan(pass:var1); }));
                    },
                    child: Text('Scan QR'),
                    color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
