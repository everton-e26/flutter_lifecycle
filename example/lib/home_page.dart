import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/flutter_lifecycle.dart';

class HomePage extends StatelessWidget {
  //on init function
  //pass to the LifeCycleWidget
  _onInit(BuildContext context) {
    //good to showDialogs only when the widget init
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Hello from init"),
            ));

    //if you need do something on dispose
    //return a Function()
    return () {
      print("disposing");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LifeCycleWidget(
        //set on init function
        onInit: _onInit,
        //builder function
        builder: (context) {
          return Center(
            child: Text("Home page"),
          );
        },
      ),
    );
  }
}
