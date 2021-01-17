import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<MyHome> {
  var name = '';
  var counter = 0;
  var _checkValue = false;
  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  void _showSnackBar() {
    scaffoldState.currentState.showSnackBar(new SnackBar(
        content: new Text(
      'Hello Flutter!',
      textDirection: TextDirection.ltr,
    )));
  }

  void onButtonClick() {
    setState(() {
      name = 'Person added';
    });
  }

  void onButton2Click(String text) {
    setState(() {
      name = text;
    });
  }

  void onButton3Click() {
    setState(() {
      name = 'FlatButton';
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void _onChangeValue(String value) {
    setState(() {
      name = 'on Changed $value';
    });
  }

  void _onSubmitValue(String value) {
    setState(() {
      name = 'on Submitted $value';
    });
  }

  void _onChecked(bool value) {
    setState(() {
      _checkValue = value;
      debugPrint('$_checkValue');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
      appBar: new AppBar(
        title: new Text(
          'Stateful widget',
          textDirection: TextDirection.ltr,
        ),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        color: Colors.indigo,
        margin: new EdgeInsets.all(10),
        padding: new EdgeInsets.all(10),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'Hello Flutter!\n$name',
              style: new TextStyle(fontSize: 18),
              textDirection: TextDirection.ltr,
            ),
            new RaisedButton(
              onPressed: onButtonClick,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Icon(Icons.add),
                  new Text(
                    'Add',
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
            ),
            new RaisedButton(
              onPressed: () => onButton2Click('Ali Mansour'),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    'Add',
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
            ),
            new FlatButton(
                onPressed: onButton3Click, child: new Text('Click Me')),
            new Text(
              'Photos taken is $counter',
              textDirection: TextDirection.ltr,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new IconButton(
                    icon: new Icon(Icons.add_a_photo_outlined),
                    onPressed: incrementCounter),
                new IconButton(
                    icon: new Icon(Icons.restore), onPressed: resetCounter),
              ],
            ),
            new Text(
              '$name',
              textDirection: TextDirection.ltr,
            ),
            new TextField(
              autocorrect: true,
              autofocus: true,
              decoration: new InputDecoration(
                icon: new Icon(Icons.person),
                enabled: true,
                labelText: 'Your name',
                hintText: 'Input your name',
              ),
              keyboardType: TextInputType.text,
              onChanged: _onChangeValue,
              onSubmitted: _onSubmitValue,
            ),
            new Checkbox(
                value: _checkValue,
                onChanged: (bool isCheckd) => _onChecked(isCheckd))
          ],
        ),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new FlatButton(
                  onPressed: null,
                  child: new Text(
                    'Home',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => debugPrint('Home'),
                  child: new Text(
                    'Profile',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: _showSnackBar,
                  child: new Text(
                    'SnackBar',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: _showMyDialog,
                  child: new Text(
                    'Alert Dialog',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => _showBottomSheet(context),
                  child: new Text(
                    'Show BottomSheet',
                    textDirection: TextDirection.ltr,
                  )),
              new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text(
                    'Close',
                    textDirection: TextDirection.ltr,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Button'),
                  onPressed: _showSimpleDialog,
                ),
                ElevatedButton(
                  child: const Text('Button 2'),
                  onPressed: () => debugPrint('Button 2'),
                ),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSimpleDialog() async {
    switch (await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: const Text('State department'),
              ),
            ],
          );
        })) {
      case 1:
        // ...
        break;
      case 2:
        // ...
        break;
    }
  }
}
