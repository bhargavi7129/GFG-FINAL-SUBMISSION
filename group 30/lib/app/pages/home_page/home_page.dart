import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:hospitalx/app/pages/appointment_schedule_page/appointment_shcedule_page.dart';
import 'package:hospitalx/app/pages/appointmentview/viewappiontment.dart';
import 'package:hospitalx/app/pages/home_page/appointment_card.dart';
import 'package:hospitalx/app/pages/home_page/doctor_card.dart';
import 'package:hospitalx/app/pages/home_page/widgets/service_tile.dart';
import 'package:hospitalx/app/pages/medical_reports/report_view.dart';
import 'package:hospitalx/app/pages/upload_files/uploadfiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Hello Rohit!!',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AppointmentSchedulePage();
                },
              ));
            },
            icon: const Icon(FluentIcons.search_12_regular),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.alert_12_regular),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Services',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceTile(
                    title: 'Medical Reports',
                    icon: FluentIcons.book_16_regular,
                    widget: reportview(),
                  ),
                  ServiceTile(
                    title: 'Book Session',
                    widget: AppointmentSchedulePage(),
                    icon: FluentIcons.book_16_regular,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceTile(
                    title: 'Upload Files',
                    icon: FluentIcons.book_16_regular,
                    widget: uploadFiles(),
                  ),
                  ServiceTile(
                    title: 'Bill Estimation',
                    icon: FluentIcons.book_16_regular,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming appointments',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextButton(
                    child: const Text('See all'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return appointmentview();
                        },
                      ));
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const appointment('1:00 am', '12/12/23', 'upcoming', '',
                  'Dr. Achyut', 'Cardio'),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top Doctors',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    doctorCard(
                      '',
                      'Dr. Achyut',
                      'Cardio',
                      5,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    doctorCard('', 'Dr. Bhavani', 'Neurosurgeons', 5),
                    SizedBox(
                      width: 20,
                    ),
                    doctorCard('', 'Dr. subhadeep', 'General', 5),
                    SizedBox(
                      width: 20,
                    ),
                    doctorCard('', 'rocks', '---', 5),
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
