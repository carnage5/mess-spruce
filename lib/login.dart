
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool lg=true;
  TextEditingController srn_controller= TextEditingController();
  TextEditingController password_controller= TextEditingController();
  final _form=GlobalKey<FormState>();
  //String? password;//holds password value once login button is pressed
  String? srn; //holds srn value once login button is pressed
  var password_check;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            'Mess Spruce',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Form(
            key: _form,
              child: Column(
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: srn_controller,
                    decoration: InputDecoration(
                      labelText: "SRN",
                      labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.amberAccent,),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blueGrey,
                      filled: true,
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 16.0),
                    child: TextFormField(
                      controller: password_controller,
                      validator: (val){
                        if(val==null || val.isEmpty)
                        {return 'Required';}
                        if(val.compareTo(password_check)!=0)
                          return 'Password does not match ';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.amberAccent,),
                        border: OutlineInputBorder(),
                        fillColor: Colors.blueGrey,
                        filled: true,
                      ),
                    ),
                  ),
               ],
              ),
          ),
          SizedBox(
            height: 20.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 75.0),
            child: ButtonTheme(
              height: 50.0,
              child: FlatButton(
                  onPressed: (){
                    password_check='hoho';
                    srn=srn_controller.text.toString();
                    //password=password_controller.text.toString();
                    if(_form.currentState!.validate())
                      {
                        Navigator.pushNamed(context, '/menu');
                      }

                  },
                  child: Text('Login'),
              color: Colors.amberAccent,),
            ),
          )
        ],
      ),
    );
  }
}


/*
TextField(
            controller: srn_controller,
            decoration: InputDecoration(
              hintText: "SRN",
              hintStyle: TextStyle(
                color: Colors.blue,
              ),

              labelText: "SRN",
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.amberAccent,
              ),
              border: OutlineInputBorder(),
              fillColor: Colors.blueGrey,
              filled: true,
            ),
          ),
          TextField(
            controller: password_controller,
            decoration: InputDecoration(
              //hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.blue,
              ),
              labelText: "Password",
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.amberAccent,
              ),
              border: OutlineInputBorder(),
              fillColor: Colors.blueGrey,
              filled: true,
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      lg=!lg;
                    });
                  },
                  icon: Icon(lg ? Icons.remove_red_eye : Icons.security),
              ),
            ),
            obscureText: lg,
          ),
 */
