import 'package:flutter/material.dart';
import 'package:my_app/settings/privacy_and_policy.dart';
import 'package:my_app/settings/reset.dart';
import 'package:my_app/settings/terms_and_condition.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 122, 27, 139),
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Divider(
              thickness: 3,
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ));
                },
                child: ListTile(
                  title: Text(
                    'Privacy and Policy',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TermsCondition(),
                ));
              },
              child: ListTile(
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            GestureDetector(
              onTap: () {
                reset().resetApp(context);
              },
              child: ListTile(
                title: Text(
                  'Reset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Divider(thickness: 3)
          ],
        ),
      ),
    );
  }
}
