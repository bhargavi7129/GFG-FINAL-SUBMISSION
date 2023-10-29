import 'package:flutter/material.dart';
import 'package:hospitalx/app/pages/home_page/appointment_card.dart';

class appointmentview extends StatelessWidget {
  const appointmentview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
                child: Text(
              'Appointments',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 160, 190, 242)),
                  child: Center(child: Text('UpComing')),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Completed')),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text('Cancelled')),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  appointment('12/12/23', '9:00 pm', 'upcoming', '',
                      'Dr.Achyut', 'Cardio'),
                  SizedBox(
                    height: 16,
                  ),
                  appointment('12/01/24', '7:00 pm', 'upcoming', '',
                      'Dr.Bhavani', 'Neuro'),
                  SizedBox(
                    height: 16,
                  ),
                  appointment('13/01/24', '8:30 pm', 'upcoming', '',
                      'Dr.Subhadeep', 'General'),
                  SizedBox(
                    height: 16,
                  ),
                  appointment('15/01/24', '5:00 pm', 'upcoming', '', 'Dr.rocks',
                      'pediatrsian'),
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
