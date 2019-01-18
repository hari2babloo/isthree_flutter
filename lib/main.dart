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

  Future<http.Response> getdata() async{

    var url = "http://40.124.7.240/isthree/index.php/services/login";
    var body = json.encode({"userName": emailController.text ,"password":password.text });

    Map headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };


//    final response = await http.get( Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),

    final  response = await http.post(url,body: body,
        headers:{
      "Accept" : "application/json",


    }

    );

//    final  response = await http.post(url,body: body,headers: headers);
    List responseJson = JSON.decode(response.body);
    print(responseJson[0]["status"]);

    var  status =  responseJson[0]["status"];
    if(status.toString()=="0"){

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Invalid Id or Password"),
            content: new Text("Please Enter Correct Details"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );


    }

    else

      {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashpage()),
    );

      }
    //final signUp = SignUpResponse.fromJson(parse);
    return response;


//print(response.body);

//List data = JSON.decode(response.body);
//
//print(data[1]["title"]);
//
//
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => Dashpage()),
//    );
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
              RaisedButton(onPressed: getdata,color: Colors.amber,child: Text('submit'),),







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


class Dashpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }



}
