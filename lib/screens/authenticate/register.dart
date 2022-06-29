import 'package:flutter/material.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:fit_app_exam/shared/constants.dart';
import 'package:fit_app_exam/shared/loading.dart';

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
              backgroundColor: Color(0XFF1e665b),
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
            body: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: const Icon(Icons.lock_person_rounded,
                                color: Color(0XFF1e665b), size: 70.0)),
                        const SizedBox(height: 30.0),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Column(children: [
                              TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Email'),
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter Email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                              const SizedBox(height: 5.0),
                              TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Password'),
                                  obscureText: true,
                                  validator: (val) => val!.length < 6
                                      ? 'Enter password 6+ char long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  })
                            ])),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            color: Color(0XFF1e665b),
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
