import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class reportview extends StatelessWidget {
  const reportview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset('animations/noresult.json'),
          ),
          Text(
            'No files Uploaded',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
