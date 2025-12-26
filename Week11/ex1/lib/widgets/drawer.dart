import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: const Text('Classroom'), onTap: () {
            
          }),
          ListTile(title: const Text('Student'), onTap: () {}),
          ListTile(title: const Text('PRofile'), onTap: () {}),
        ],
      ),
    );
  }
}