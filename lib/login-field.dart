import 'package:book_rating/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './http-service/http-data.dart';
import 'loginpost.dart';

class LoginController extends StatefulWidget {
  LoginController({Key key}) : super(key: key);

  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  ApplicationHttpserive api = new ApplicationHttpserive();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _loginAuth() async {
    var url = "https://book-server-nudqjevwpq-uc.a.run.app/api/Users/login";
    print(username.text);
    print(password.text);

    Map data = {'username': username.text, 'password': password.text};
    var body = json.encode(data);
    Map data12 = await api.postGeneric(url, body);
    if (data12['id'] != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (
              context,
            ) =>
                Dashboard(),
          ));
    }

    print("####" + data12['id']);
    // api.postGeneric(url, body).then((res) => {

    //       print(data12['id']),
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(32),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(62), topRight: Radius.circular(62))),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Username'),
              controller: username,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 62),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            Container(
              height: 45,
              width: double.maxFinite,
              // decoration: BoxDecoration(
              //   color: Colors.deepPurpleAccent,
              //   borderRadius: BorderRadius.all(Radius.circular(32)),
              // ),
              child: RaisedButton(
                // onPressed: null,
                // textColor: Colors.white,
                // child: Text('Disabled Button',
                //     style: TextStyle(fontSize: 20)),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: const Text('Connect with App'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () async {
                  await _loginAuth();
                },
              ),
            ),
            Container(
              height: 8,
            ),
            Text(
              "Forgot your Password?",
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Icon(
                      Icons.face,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Icon(
                      Icons.fingerprint,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
