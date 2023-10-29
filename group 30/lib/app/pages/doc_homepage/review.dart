import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';

class review extends StatelessWidget {
  final String img;
  final String name;
  final int rating;
  const review(this.img, this.name, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getScreenHeight(context) * 0.15,
      width: Helper.getScreenWidth(context) * 0.9,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      'https://img.freepik.com/premium-photo/portrait-glad-smiling-doctor-white-uniform-standing-with-crossed-hands-white_168410-786.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '$rating ' + '⭐',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: Helper.getTheme(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Center(child: Text('Read review')),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
