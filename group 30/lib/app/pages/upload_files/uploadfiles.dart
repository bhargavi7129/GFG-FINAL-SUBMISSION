import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:lottie/lottie.dart';

class uploadFiles extends StatelessWidget {
  const uploadFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Helper.getScreenHeight(context) * 0.5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Lottie.asset(
                  'animations/upload.json',
                ),
                Text('upload your files', style: TextStyle(fontSize: 20)),
                Container(
                  height: 30,
                  width: 100,
                  child: Center(child: Text('Upload')),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      color: Helper.getTheme(context)
                          .colorScheme
                          .primaryContainer),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
