import 'dart:convert';

import 'package:app_test/models/exam.dart';
import 'package:app_test/pages/login_page.dart';
import 'package:app_test/widgets/exam_list_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const String data = '''
{
  "resultados": {
    "exames": [
      {
        "id": 1,
        "paciente": "João Pedro",
        "status": "Processando",
        "data": "08/08/2022"
      },
      {
        "id": 2,
        "paciente": "Marcelo Miguel",
        "status": "Finalizado",
        "data": "09/08/2022"
      },
      {
        "id": 3,
        "paciente": "Marcos Pontes",
        "status": "Processando",
        "data": "05/08/2022"
      }
    ]
  }
}
''';

const result = "resultados";
const exams = "exames";

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Exam> list = [];

  @override
  void initState() {
    super.initState();
    var dataConvert = json.decode(data);
    List dataList = dataConvert[result][exams] as List;
    list = dataList.map((e) => Exam.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Exames"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Sair do aplicativo"),
                        content: const Text(
                            "Você realmente deseja sair do aplicativo?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancelar")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text("Sim")),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _openCamera();
          },
          child: const Icon(Icons.camera_alt),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ExamListItem(exam: list[index]);
            }),
      ),
    );
  }

  void _openCamera() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
