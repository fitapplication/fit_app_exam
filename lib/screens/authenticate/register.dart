import 'package:flutter/material.dart';
import 'package:loginfede/services/auth.dart';
import 'package:loginfede/shared/constants.dart';
import 'package:loginfede/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              elevation: 0.0,
              title: Text('Sign-up to FitPet'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView!();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'))
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            obscureText: true,
                            validator: (val) => val!.length < 6
                                ? 'Enter password 6+ char long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            color: Colors.pink[600],
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);

                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Please supply a valid email or password';
                                    loading = false;
                                  });
                                }
                              }
                            }),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ))));
  }
}
