import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';

class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? widget;

  const ServiceTile(
      {super.key, required this.title, required this.icon, this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Helper.getScreenWidth(context) * 0.4,
      child: Card(
        child: ListTile(
          onTap: () => widget == null
              ? null
              : Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => widget!)),
          title: Text(
            title,
            style: Helper.getTheme(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          leading: Icon(
            icon,
            size: 12,
          ),
          dense: true,
        ),
      ),
    );
  }
}
