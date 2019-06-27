import 'package:flutter/material.dart';
import 'package:loginapp/view/SignUpPage.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String validateEmail(String value){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if(!regex.hasMatch(value) && value.isNotEmpty)
      return 'Enter valid email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.greenAccent
              ),
            ),
          ),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              hasFloatingPlaceholder: true,
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
              labelText: 'Password',
              labelStyle: TextStyle(
                  color: Colors.greenAccent
              ),
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                icon: _obscureText ? Icon(Icons.visibility, color: Colors.black, size: 20.0,) : Icon(Icons.visibility_off, color: Colors.grey, size: 20.0,),
                onPressed: _toggle,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.greenAccent,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            margin: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Don\'t have an account yet?'
                ),
                InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));},
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}