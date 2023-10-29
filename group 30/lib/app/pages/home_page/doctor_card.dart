import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';

class doctorCard extends StatelessWidget {
  final String img;
  final String docname;
  final String spec;
  final double rating;
  const doctorCard(this.img, this.docname, this.spec, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getScreenHeight(context) * 0.25,
      width: Helper.getScreenWidth(context) * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              'https://img.freepik.com/premium-photo/portrait-glad-smiling-doctor-white-uniform-standing-with-crossed-hands-white_168410-786.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 22,
              ),
              Text(
                docname,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 22,
              ),
              Text(
                spec,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Text('$rating' + ' ' + '⭐'),
            ],
          )
        ],
      ),
    );
  }
}
