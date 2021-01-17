import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  String _age;

  Third(this._age);

  @override
  State<Third> createState() => _ThirdState(_age);
}

class _ThirdState extends State<Third> {
  String _age;

  _ThirdState(this._age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Navigation'),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Third Page'),
            Text('Your age is $_age'),
            Visibility(
              visible: true,
              child: ElevatedButton(
                  onPressed: () => _onPreviousButtonClicked(context),
                  child: Text('Previous')),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreviousButtonClicked(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/First', (route) => false);
    }
  }
}
