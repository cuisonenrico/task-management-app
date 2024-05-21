import 'package:flutter/material.dart';
import 'package:task_management_app/utilities/widget_constants.dart';

class CreateEventDialog extends StatelessWidget {
  const CreateEventDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Add new event'),
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 100,
          width: 300,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultQuarterPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
              ),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
