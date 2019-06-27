import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: MediaQuery.of(context).size.height * 1.0,
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(1.0),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}