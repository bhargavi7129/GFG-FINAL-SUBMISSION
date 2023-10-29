import 'package:flutter/material.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:hospitalx/app/pages/appointment_schedule_page/widgets/doctor_card.dart';
import 'package:searchable_listview/searchable_listview.dart';

List<String> docs = [
  'John Sanders',
  'Cancer M.',
  'Cassidy Klein',
  'John Kimbop',
];

class AppointmentSchedulePage extends StatelessWidget {
  const AppointmentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                children: [],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SearchableList(
                    displayClearIcon: false,
                    initialList: docs,
                    builder: (displayedList, itemIndex, item) => Column(
                      children: [
                        DoctorCard(
                            name: item,
                            specialty: 'cancer',
                            imageUrl:
                                'https://thumbs.dreamstime.com/z/portrait-happy-young-handsome-indian-man-doctor-smiling-studio-shot-against-white-background-137823661.jpg?w=992'),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                    filter: (value) => docs
                        .where(
                          (element) => element.toLowerCase().contains(value),
                        )
                        .toList(),
                    inputDecoration: InputDecoration(
                      labelText: "Search Doctor",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Helper.getTheme(context)
                              .colorScheme
                              .inversePrimary,
                          width: 2.0,
                        ),
                      ),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
