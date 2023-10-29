import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:hospitalx/app/pages/doc_homepage/docappionment.dart';
import 'package:hospitalx/app/pages/doc_homepage/review.dart';

class docHomePage extends StatelessWidget {
  const docHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: Helper.getTheme(context)
                            .colorScheme
                            .primaryContainer),
                    child: Center(child: Text('See all')),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: Helper.getScreenHeight(context) * 0.35,
                width: Helper.getScreenHeight(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      docappiontment('12/12/23', 'Manipal Hospital', '9:00 am'),
                      SizedBox(
                        height: 12,
                      ),
                      docappiontment('12/12/23', 'Manipal Hospital', '9:00 am'),
                      SizedBox(
                        height: 12,
                      ),
                      docappiontment('12/12/23', 'Manipal Hospital', '9:00 am'),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 22,
                  ),
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: Helper.getTheme(context)
                            .colorScheme
                            .primaryContainer),
                    child: Center(child: Text('See all')),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    review('', 'Achyut Badyal', 5),
                    SizedBox(
                      height: 10,
                    ),
                    review('', 'Bhavani Bojedla', 4),
                    SizedBox(
                      height: 10,
                    ),
                    review('', 'Subhadeep Thandaka', 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
