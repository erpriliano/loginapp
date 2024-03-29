import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class SignUpComponent extends StatefulWidget {
  @override
  _SignUpComponentState createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  int _currStep = 0;

  int _start = 59;
  int _current = 59;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() { _current = _start - duration.elapsed.inSeconds; });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  String validateName(String value) {
    if (value.length < 3 && value.isNotEmpty) {
      return 'Name must be more than 2 characters';
    } else {
      return null;
    }
  }

  String validateEmail(String value){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if(!regex.hasMatch(value) && value.isNotEmpty)
      return 'Enter valid email';
    else
      return null;
  }

  String validatePass(String value) {
    if(value.length < 6 && value.isNotEmpty) {
      return 'Password must be 6 characters or more';
    } else {
      return null;
    }
  }

  List<Step> _listSteps() {
    List<Step> _steps = [
      Step(
        title: Text('Name'),
        content: TextFormField(
          validator: validateName,
          decoration: InputDecoration(
            labelText: 'Enter your name',
            labelStyle: TextStyle(
              color: Colors.greenAccent,
            ),
          ),
        ),
        isActive: _currStep >= 0,
      ),
      Step(
        title: Text('Email'),
        content: TextFormField(
          validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Enter your email',
            labelStyle: TextStyle(
              color: Colors.greenAccent,
            ),
          ),
        ),
        isActive: _currStep >= 1,
      ),
      Step(
        title: Text('Password'),
        content: TextFormField(
          validator: validatePass,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter your password',
            labelStyle: TextStyle(
              color: Colors.greenAccent,
            ),
          ),
        ),
        isActive: _currStep >= 2,
      ),
      Step(
        title: Text('Phone Number'),
        content: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter your phone number',
            labelStyle: TextStyle(
              color: Colors.greenAccent,
            ),
          ),
        ),
        isActive: _currStep >= 3,
      ),
      Step(
        title: Text('Verification'),
        subtitle: Container(width: MediaQuery.of(context).size.width * 0.7, child: Text('An OTP (One Time Password) was sent to your registered phone number'),),
        content: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  labelStyle: TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.0,),
            Column(
              children: <Widget>[
                Icon(Icons.timer),
                Text("$_current"),
              ],
            ),
          ],
        ),
        isActive: _currStep >= 4,
      ),
    ];
    return _steps;
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: this._currStep,
      steps: _listSteps(),
      onStepTapped: (step) {
        setState(() {
          this._currStep = step;
        });
      },
      onStepContinue: () {
        setState(() {
          if(this._currStep < this._listSteps().length - 1){
            this._currStep = this._currStep + 1;
          }else{
            print('Completed');
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if(this._currStep > 0){
            this._currStep = this._currStep - (this._listSteps().length - 1);
          }else{
            this._currStep = 0;
          }
        });
      },
      controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        if(this._currStep == this._listSteps().length - 1){
          return Row(
            children: <Widget>[
              ButtonTheme(
                minWidth: 80,
                child: RaisedButton(
                  elevation: 2.0,
                  onPressed: () {startTimer();},
                  color: _current == 0 ? Colors.greenAccent : Colors.orange,
                  child: _current == 0 ? Text('Verify', style: TextStyle(color: Colors.white),) : Text('Resend', style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(width: 20,),
              ButtonTheme(
                minWidth: 80,
                child: RaisedButton(
                  elevation: 2.0,
                  onPressed: onStepCancel,
                  color: Colors.white,
                  child: Text('Back', style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          );
        }else{
          return Row(
            children: <Widget>[
              ButtonTheme(
                minWidth: 80,
                child: RaisedButton(
                  elevation: 2.0,
                  color: Colors.greenAccent,
                  onPressed: onStepContinue,
                  child: Text('Next', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}