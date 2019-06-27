import 'package:flutter/material.dart';
import 'package:loginapp/component/Background.dart';
import 'package:loginapp/component/LoginComponent.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 1.0;

    return Scaffold(
      resizeToAvoidBottomPadding: true, //resizing layout when keyboard appears on the screen
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: _height / 2.8,
                child: Background(),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Consultly',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      'Your Perfect Clinic Assistant',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Container(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Container(
                            child: LoginComponent(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
