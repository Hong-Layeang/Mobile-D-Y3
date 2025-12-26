import 'package:flutter/material.dart';

import 'classroom/classroom_details.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({super.key});

  @override
  Widget build(BuildContext context) {
    final classrooms = [
      'Flutter – Group 1',
      'Algorithms – Group 7',
      'Web Dev – Group 3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Classrooms')),
      body: ListView.builder(
        itemCount: classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classrooms[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(classroom),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  ClassroomDetails

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ClassroomDetails(classroomId: classroom),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
