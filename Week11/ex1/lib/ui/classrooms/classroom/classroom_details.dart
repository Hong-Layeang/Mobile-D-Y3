import 'package:flutter/material.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.classroomId)),
      body: Container(
        color: Colors.green,
        child: Center(child: Text("Classroom ${widget.classroomId}")),
      ),
    );
  }
}
