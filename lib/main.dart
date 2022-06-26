import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/user.dart';
import 'package:fit_app_exam/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_app_exam/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Username?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
