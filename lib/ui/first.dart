import 'package:flutter/material.dart';
import 'package:flutter_layouts/functions/GlobalState.dart';

class First extends StatefulWidget {
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  GlobalState _store = GlobalState.instance;
  TextEditingController _name;

  @override
  void initState() {
    _name = TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
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
            Text('First Page'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
              controller: _name,
            ),
            ElevatedButton(
              onPressed: () => _onNextButtonClicked(context),
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }

  void _onNextButtonClicked(BuildContext context) {
    _store.set('name', _name.text);
    Navigator.of(context).pushNamed('/Second');
  }
}
