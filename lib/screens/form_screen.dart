import 'package:flutter/material.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(title: const Text("Form implementation page")),
        body: Center(
          child: Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                print(value);
                if (value == null || value.isEmpty) {
                  return "Please write  something!!!";
                }

                return null;
              },
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..clearSnackBars()
                    ..showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Form field submitted successfully"),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
