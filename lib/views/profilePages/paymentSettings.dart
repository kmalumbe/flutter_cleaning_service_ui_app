import 'package:flutter/material.dart';

class PaymentSettings extends StatefulWidget {
  @override
  _PaymentSettingsState createState() => _PaymentSettingsState();
}

class _PaymentSettingsState extends State<PaymentSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Profile Settings'),
        ),
      ),
    );
  }
}
