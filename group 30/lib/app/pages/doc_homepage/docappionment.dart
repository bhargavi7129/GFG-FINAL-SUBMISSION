import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';

class docappiontment extends StatelessWidget {
  final String time;
  final String date;
  final String hos_name;
  const docappiontment(this.date, this.hos_name, this.time);

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
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 33,
              ),
              Icon(FluentIcons.clock_12_regular),
              SizedBox(
                width: 10,
              ),
              Text(
                '$time',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 60,
              ),
              Icon(FluentIcons.calendar_12_regular),
              SizedBox(
                width: 10,
              ),
              Text(
                '$date',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: Helper.getScreenWidth(context) * 0.75,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color:
                        Helper.getTheme(context).colorScheme.primaryContainer),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(FluentIcons.location_12_regular),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '$hos_name',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
