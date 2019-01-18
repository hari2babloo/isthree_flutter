import 'dart:_http';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int number = 0;
  var httpClient = new HttpClient();

  Future<String> getdata() async{


    http.Response response = await http.get( Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),

        headers:{
      "Accept" : "application/json"

    }
    );
//print(response.body);

List data = JSON.decode(response.body);

print(data[1]["title"]);


  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void subtractNumbers() {
    setState(() {
      number = number - 1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(

        child: new Column(


          children: <Widget>[

            new Text( emailController.text,

              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: 'Roboto',
              ),
            ),

             TextField(controller: emailController, decoration: InputDecoration(border: InputBorder.none,hintText: 'Enter Email ID'),),
             TextField(controller:password,decoration: InputDecoration(border: InputBorder.none,hintText: 'Enter Password'),),
            // TextField(decoration: InputDecoration(border: InputBorder.none,hintText: 'Enter a Name'),),
              RaisedButton(onPressed: getdata,color: Colors.amber,child: Text('submitsubmitsubmit'),),







          ],









        )









      ),



      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  login() {

    Text('hello');



  }
}
