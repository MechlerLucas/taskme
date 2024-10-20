import 'package:flutter/material.dart';

class NewTaskPopup {
  static Future<void> showNewTaskPopup(BuildContext context) async {
    // Controladores para capturar os dados inseridos
    final TextEditingController taskDescriptionController = TextEditingController();
    final TextEditingController taskRecurrenceController = TextEditingController();
    final TextEditingController taskDetailsController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nova Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: taskDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição da task',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: taskRecurrenceController,
                decoration: const InputDecoration(
                  labelText: 'Recorrência',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: taskDetailsController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Criar'),
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
