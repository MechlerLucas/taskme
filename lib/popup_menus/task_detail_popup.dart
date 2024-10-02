import 'package:flutter/material.dart';

class TaskPopup {
  static Future<void> showTaskPopup(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('<NOME DA TASK>'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Descrição da task: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Recorrência: Diária',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
