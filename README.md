# flutter_lifecycle

Get access to Flutter's life cycle on StatelessWidgets

## Getting Started

You should ensure that you add the flutter_lifecycle as a dependency in your flutter project.

read more at [how to install](https://pub.dev/packages/flutter_lifecycle#-installing-tab-)

## Usage

```dart

import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/flutter_lifecycle.dart';

class HomePage extends StatelessWidget {
  //on init function
  //pass to the LifeCycleBuilder
  Dispose _onInit(BuildContext context) {
    //good to showDialogs only when the widget init
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Hello from init"),
            ));

    //if you need do something on dispose
    //return a Function()
    return () {
      print("on dispose");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LifeCycleBuilder(
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

```

checkout app source at [github](https://github.com/everton-e26/flutter_lifecycle/tree/master/example)
