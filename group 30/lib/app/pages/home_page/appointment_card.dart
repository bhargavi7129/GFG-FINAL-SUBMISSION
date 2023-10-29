import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:hospitalx/app/pages/appointment_schedule_page/appointment_shcedule_page.dart';
import 'package:hospitalx/app/pages/appointment_schedule_page/sub_pages/doctor_profile_page.dart';

class appointment extends StatelessWidget {
  final String time;
  final String date;
  final String status;
  final String docimg;
  final String doc_name;
  final String doc_spec;

  const appointment(this.date, this.time, this.status, this.docimg,
      this.doc_name, this.doc_spec);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getScreenHeight(context) * 0.2,
      width: Helper.getScreenWidth(context) * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(children: [
        Row(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 120,
                  child: Image.network(
                      'https://img.freepik.com/premium-photo/portrait-glad-smiling-doctor-white-uniform-standing-with-crossed-hands-white_168410-786.jpg'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FluentIcons.clock_12_regular, size: 20),
                        Text(
                          time,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          FluentIcons.calendar_12_regular,
                          size: 20,
                        ),
                        Text(
                          date,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      doc_name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      doc_spec,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const DoctorProfilePage(
                                name: 'Dr. Achyut',
                                specialty: 'Cardio',
                                doctorRating: 5,
                                about:
                                    'doctor  Achyut is one of the best doctor in the field of cardiology',
                                imageUrl:
                                    'https://img.freepik.com/premium-photo/portrait-glad-smiling-doctor-white-uniform-standing-with-crossed-hands-white_168410-786.jpg');
                          },
                        ));
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            color: Helper.getTheme(context)
                                .colorScheme
                                .primaryContainer),
                        child: const Center(child: Text('Reschedule')),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
