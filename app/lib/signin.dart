import 'package:flutter/material.dart';
import 'package:statusbar/statusbar.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var authc = FirebaseAuth.instance;
  String email  ;
  String password;
  bool sspin = false;
  int selectedRadio;

  @override
  void initState()
  {
    super.initState();
    selectedRadio = 0;
    super.initState();
    StatusBar.color(Color.fromRGBO(90, 200, 250, 1)
    );
  }
  setSelectedRadio(int val) {
  setState(() {
    selectedRadio = val;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      //appBar: AppBar(
        //title: Text("hello"),
      //),
      body: ModalProgressHUD(
              inAsyncCall: sspin ,
        child: SingleChildScrollView(
                  child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/login.png'),
                  fit: BoxFit.fill)
                ),
                //child: Image.asset('assets/login.png'), 
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Student'),
                  Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Color.fromRGBO(100, 210, 255, 1),
                      onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                     },
                    ), 
                    Text('Mentor'),
                  Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Color.fromRGBO(100, 210, 255, 1),
                      onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
               ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.0),
	           decoration: BoxDecoration(
	           border: Border(bottom: BorderSide(color: Colors.grey[100]))
	              ),
              child: TextField(
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Email',
              hintStyle:TextStyle(color: Colors.grey[400]),
               ),
              onChanged: (value){
             email = value;
                  },
               ),
              ),
          Container(
            padding: EdgeInsets.all(8.0),
	        decoration: BoxDecoration(
               border: Border(bottom: BorderSide(color: Colors.grey[100]))
	              ),
            child: TextField(
            obscureText: true,
            autocorrect: false,
            decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Password',
            hintStyle:TextStyle(color: Colors.grey[400]),
                  ),
            onChanged: (value){
                password = value;
                },
              ),
              ), 
                
                Row(
                  children: <Widget> [
                    Text('Remember Me'),
                    Radio(
                       value: 3,
                       groupValue: selectedRadio,
                       activeColor: Color.fromRGBO(100, 210, 255, 1),
                       onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                         },
                    ),
                  ],
                ),
                 SizedBox(
                   child: FlatButton(
                     /*onPressed: () {
                       Navigator.pushNamed(context, "dashboard");
                     },*/
                     onPressed: () async {
                          setState(() {
                             sspin = true;
                          });
                          try {
                          var signin = await authc.signInWithEmailAndPassword(email: email, password: password);
                          if(signin != null ){
                            Navigator.pushNamed(context, "dashboard");
                            setState(() {
                              sspin = false;
                            });
                          }
                          print(signin);
                        }
                        catch(e)
                        {
                          String error = e.toString();
                          Toast.show(error, context, duration: Toast.LENGTH_LONG , gravity:  Toast.BOTTOM);
                          print(e);
                        }
                        },
                    //padding:EdgeInsets.all(20),
                    child: Text("Sign In"),
                    color: Color.fromRGBO(100, 210, 255, 1),  
                   ),
                 ),
               ],
              
           ),
        ),
    )
  );
 }
}