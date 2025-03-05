import 'package:flutter/material.dart';

List<Object> errorList = [];
List<String> errorListId = [];

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Errors'),
      ),
      body: ListView.builder(
        itemCount: errorList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(errorList.elementAt(index).toString()),
            subtitle: Text('Error: ${errorListId.elementAt(index).toString()}'),
            leading: Text(
              (index + 1).toString(),
            ),
          );
        },
      ),
    );
  }
}
