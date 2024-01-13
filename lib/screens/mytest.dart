import 'package:flutter/material.dart';

class Mytest extends StatefulWidget {
  const Mytest({Key? key}) : super(key: key);

  @override
  State<Mytest> createState() => _MytestState();
}

class _MytestState extends State<Mytest> {
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        // the Form here
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Enter your email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // Check if this field is empty
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }

                  // using regular expression
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }

                  // the email is valid
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextButton(
                  onPressed: _saveForm, child: const Text('Check Email')),
              const SizedBox(height: 25),
              _isValid ? const Text('Your email seems nice!') : Container()
            ],
          ),
        ),
      ),
    );
  }
}