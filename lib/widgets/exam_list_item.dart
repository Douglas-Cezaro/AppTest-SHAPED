import 'package:app_test/models/exam.dart';
import 'package:flutter/material.dart';

class ExamListItem extends StatelessWidget {
  const ExamListItem({
    Key? key,
    required this.exam,
  }) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    void _openPopoup() {
      const processando = "PROCESSANDO";
      const finalizado = "FINALIZADO";

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Status"),
              content: Text(
                exam.status,
                style: TextStyle(
                  color: exam.status.toUpperCase() == processando
                      ? Colors.blue
                      : exam.status.toUpperCase() == finalizado
                          ? Colors.green
                          : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK")),
              ],
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: _openPopoup,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                exam.data,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                exam.paciente,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
