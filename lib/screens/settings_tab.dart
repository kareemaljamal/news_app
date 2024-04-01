import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Settings Tab',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
