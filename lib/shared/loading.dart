import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
