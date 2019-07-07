import 'package:flutter/material.dart';
import 'package:myapp/Shift.dart';
import 'package:myapp/Work.dart';

final Work work = new Work();
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'Welcom Flutter',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = '今天舅舅什么班';

  @override
  Widget build(BuildContext context) {
    final test = work.todayShift == null ? "请设置轮班信息" : work.todayShift.name;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '$test',
              style: Theme.of(context).textTheme.display3,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new SettingPage()),
          );
        },
        child: new Icon(Icons.settings),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  final title = '设置工作周期';

  @override
  Widget build(BuildContext context) {
    return new SettingPageWidget(title: title);
  }
}

class SettingPageWidget extends StatefulWidget {
  final title;

  SettingPageWidget({this.title});

  @override
  _SettingPageWidgetState createState() => new _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  void _addWork(text) {
    setState(() {
      work.add(new Shift(text));
      work.setTodayShift(0);
    });
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Text(work.shifts.toString()),
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: new SimpleDialog(
                    title: new Text('添加工作类型'),
                    contentPadding: new EdgeInsets.all(20.0),
                    children: <Widget>[
                      new TextField(
                          autofocus: true,
                          onSubmitted: (text) {
                            Navigator.pop(context);
                            _addWork(text);
                          }),
                    ],
                  ));
            },
            child: new Icon(Icons.add)),
      );
}
