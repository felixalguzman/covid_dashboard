import 'package:covid_dashboard/models/summary.dart';
import 'package:covid_dashboard/services/networking.dart';
import 'package:covid_dashboard/utilities/constans.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Covid Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loaded = false;
  Summary summary;
  NetworkHelper helper = NetworkHelper(covidAPI);

  void fetchData() async {
    var json = await helper.getData();

    setState(() {
      try {
        summary = Summary.fromJson(json);
        print('countries ? $summary');
        loaded = true;
      } catch (ex) {
        print('error leyendo json $ex');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (loaded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card("New Deaths : ${summary.global?.newDeaths}"),
                  Card("Total Deaths : ${summary.global?.totalDeaths}"),
                  Card("New Confirmed : ${summary.global.newConfirmed}"),
                  Card("Total Confirmed : ${summary.global.totalConfirmed}"),
                  Card("New Recovered : ${summary.global.newRecovered}"),
                  Card("Total Recovered : ${summary.global.totalRecovered}"),
                ],
              ),
            Text(
              loaded ? '${summary.countries.length}' : 'loading',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {

    if(!loaded){
      fetchData();
    }


  }
}

class Card extends StatelessWidget {
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
//      width: 160,
//      height: 100,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(6),
////        color: Colors.amberAccent,
//      ),
      child: Text(
        text,
      ),
    );
  }

  Card(this.text);
}
