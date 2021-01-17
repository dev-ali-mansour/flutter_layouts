import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/functions/GlobalState.dart';
import 'package:flutter_layouts/ui/third.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  GlobalState _Store = GlobalState.instance;
  TextEditingController _age;

  @override
  void initState() {
    _age = TextEditingController();
  }

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
            Text('Second Page'),
            Text('Welcome back ${_Store.get('name')}'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your Age',
              ),
              controller: _age,
            ),
            ElevatedButton(
              onPressed: () => _onPreviousButtonClicked(context),
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () => _onNextButtonClicked(context),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  void _onPreviousButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onNextButtonClicked(BuildContext context) {
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil('/Third', (route) => false);
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Third(_age.text)));
  }
}
