import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
      home: new MyHomePage(),
      theme: new ThemeData(
          primarySwatch: Colors.teal, brightness: Brightness.dark),
    ));

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("My Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person_data.json'),
              builder: (context, snapshot) {
                data = json.decode(snapshot.data.toString());

                return new ListView.builder(
                    itemBuilder: (context, int index) {
                      return new Card(
                        margin: const EdgeInsets.all(8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name - " + data[index]["name"]),
                            new Text("Name - " + data[index]["age"]),
                            new Text("Name - " + data[index]["gender"]),
                            new Text("Name - " + data[index]["hair_color"])
                          ],
                        ),
                      );
                    },
                    itemCount: data == null ? 0 : data.length);
              }),
        ),
      ),
    );
  }
}
