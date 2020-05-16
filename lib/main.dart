import 'package:flutter/material.dart';
import 'package:flutterapi/post_result_model.dart';
import 'package:flutterapi/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: Icon(Icons.home),
        title: Center(
          child: Text("API 20160801250"),
        ),
        actions: <Widget>[Icon(Icons.camera_enhance)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null)
                ? postResult.id +
                    " | " +
                    postResult.name +
                    " | " +
                    postResult.job +
                    " | " +
                    postResult.created
                : "Tidak Ada Data"),
            RaisedButton(
              onPressed: () {
                PostResult.connectToAPI("Juni", "Mahasiswa")
                    .then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("GET"),
            )
          ],
        ),
      ),
    ));
  }
}
