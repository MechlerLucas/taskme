import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../popup_menus/new_task_popup.dart';
import '../popup_menus/task_detail_popup.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  DateTime? selectedDate;
  List<Color> arrowColors = [Colors.grey, Colors.yellow, Colors.red];

  List<int> arrowState = [0, 0, 0, 0, 0, 0];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: selectedDate == null
                          ? 'Data'
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Cards falsos para fins de amonstragem

            // Card para "Hoje"
            _buildTaskCard(
              title: 'Hoje - 29/08/24',
              tasks: [
                _buildTaskItem('Pagar Aluguel', '1100 Reais', 0),
                _buildTaskItem('Pix Rafael', '65 Reais', 1),
                _buildTaskItem('Academia', 'Ficha A', 2),
              ],
            ),
            const SizedBox(height: 10),

            // Card para "Amanhã"
            _buildTaskCard(
              title: 'Amanhã - 30/08/24',
              tasks: [
                _buildTaskItem('Pagar Academia', '120 Reais', 3),
                _buildTaskItem('Aula Pós-Online', 'Php Avançado', 4),
                _buildTaskItem('Remédio Metformina', '14h', 5),
              ],
            ),

            // FIM Cards falsos para fins de amonstragem

            const Spacer(), //Arrumar a tela para ter barras laterais, com isso essa linha some

            Center(
              child: ElevatedButton(
                onPressed: () {
                  NewTaskPopup.showNewTaskPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Criar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Método para construir os cards com os itens
  Widget _buildTaskCard({required String title, required List<Widget> tasks}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...tasks,
          ],
        ),
      ),
    );
  }

  // Método para construir cada item dentro dos cards
  Widget _buildTaskItem(String taskTitle, String taskSubtitle, int arrowIndex) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            TaskPopup.showTaskPopup(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8), // Espaçamento entre os cards
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white, // Cor de fundo do item
              borderRadius: BorderRadius.circular(12), // Bordas arredondadas
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Sombra suave
                  blurRadius: 6,
                  offset: const Offset(0, 3), // Sombra deslocada para baixo
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_border),
                        const SizedBox(width: 8),
                        Text(
                          taskTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      taskSubtitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_upward,
                    color: arrowColors[arrowState[arrowIndex]],
                  ),
                  onPressed: () {
                    setState(() {
                      // Muda a cor da seta ciclicamente (cinza -> amarelo -> vermelho)
                      arrowState[arrowIndex] =
                          (arrowState[arrowIndex] + 1) % arrowColors.length;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}