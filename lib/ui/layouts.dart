import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _onHomePressed() {
      var x = 2;
      var y = 5;
      debugPrint('Result = ${x + y}');
    }

    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
          title: new Text('Flutter App'),
          backgroundColor: Colors.indigo.shade600,
          actions: [
            new IconButton(
                icon: new Icon(Icons.alarm),
                onPressed: () => debugPrint('Alarm')),
            new IconButton(
                icon: new Icon(Icons.home), onPressed: () => _onHomePressed()),
          ]),
      body: new Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                'Ali Mansour',
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              new Container(
                color: Colors.indigo,
                child: new InkWell(
                  child: Text(
                    'Another Container',
                    style: new TextStyle(fontSize: 35),
                    textDirection: TextDirection.ltr,
                  ),
                  onDoubleTap: () => debugPrint('Double tapped!'),
                  onTap: () => debugPrint('Single tapped!'),
                  onLongPress: () => debugPrint('Long pressed!'),
                ),
              ),
              new Text(
                'Flutter App',
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(
                      'First',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    new Text(
                      'Second',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Expanded(
                        child: new Text(
                      'Third One',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), label: 'Home'),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.person), label: 'Account'),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.build_sharp), label: 'Settings'),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.notification_important),
                label: 'Notifications'),
          ],
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.indigo,
          onTap: (int x) => debugPrint('index: $x')),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: ()=>debugPrint('Add new contact!'),
        child: new Icon(Icons.add),
      ),
    );
  }
}
