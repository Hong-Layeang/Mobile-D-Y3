import 'package:flutter/material.dart';
import 'package:ex1/ui/students/student/student_details.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      'Visal – Group 1',
      'Lyly – Group 7',
      'Dara – Group 3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Student')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  StudentDetails

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentDetails(studentId: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
