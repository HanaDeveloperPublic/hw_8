import 'package:flutter/material.dart';
import 'package:hw_8/pages/tasks.dart';

class AddTask extends StatefulWidget {
  final Function(TaskClass) addTask;
  const AddTask(this.addTask, {super.key});
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController tasknameController = TextEditingController();
  TextEditingController taskDesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Task Name', tasknameController),
            buildTextField('Description', taskDesController),
            ElevatedButton(
              onPressed: () {
                final task = TaskClass(tasknameController.text, taskDesController.text);
                widget.addTask(task);
                Navigator.of(context).pop();
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String hint, TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.all(4),
    child: TextField(
      decoration: InputDecoration(
        labelText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      controller: controller,
    ),
  );
}
