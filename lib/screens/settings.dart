import 'dart:js_util';

import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 103, 93, 1),
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Card(
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Privacy and Policy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
