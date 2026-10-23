import 'package:flutter/material.dart';

import 'student.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Activity 1',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: studentColor),
    home: Scaffold(
      appBar: AppBar(title: const Text('Activity 1 - $studentName')),
      body: const Center(child: SingleChildScrollView(child: ProfileCard())),
    ),
  );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: colors.primary,
              child: Icon(Icons.person, size: 56, color: colors.onPrimary),
            ),
            const SizedBox(height: 16),
            const Text(
              'Marc Elson Rebato',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Bachelor of Science in Information Technology',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.email, size: 20),
                SizedBox(width: 8),
                Flexible(child: Text('marcelson.rebato@gmail.com')),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, size: 20),
                SizedBox(width: 8),
                Text('0921 219 2822'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
