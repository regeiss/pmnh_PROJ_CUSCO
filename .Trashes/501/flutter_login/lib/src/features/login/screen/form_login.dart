import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State {
//This key will be used to identify the state of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
