import 'package:flutter/material.dart';
import 'package:loginapp/component/SignUpComponent.dart';

class SignUpPage extends StatelessWidget {

  Widget _buildAppBar(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 25.0),
      height: MediaQuery.of(context).size.height * 0.08,
      child: Material(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        color: Colors.greenAccent,
        child: Container(
          padding: const EdgeInsets.only(right: 30),
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Center(
            child: Text(
              'Create an Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildAppBar(context),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SignUpComponent(),
              ),
            ],
          ),
        )
      ),
    );
  }
}