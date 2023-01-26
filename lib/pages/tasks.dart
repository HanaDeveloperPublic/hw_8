import 'package:flutter/material.dart';
import 'package:hw_8/pages/add_task.dart';

import 'settings.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    if (currentIndex == 0) {
      body = const Task();
    } else {
      body = const SettingsPage();
    }
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (newIndex) {
              currentIndex = newIndex;
              setState(() {});
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.green),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings", backgroundColor: Colors.yellow),
            ]),
        // appBar: AppBar(title: const Text('Home Work 8')),
        body: Container(child: body));
  }
}

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final List<TaskClass> task_list = [
    TaskClass("Navigation bar home work ", "done the task in 1 hour "),
    TaskClass("Navigation bar home work ", "done the task in 1 hour "),
    TaskClass("Navigation bar home work ", "done the task in 1 hour "),
    TaskClass("Navigation bar home work ", "done the task in 1 hour "),
    TaskClass("Navigation bar home work ", "done the task in 1 hour "),
  ];

  @override
  Widget build(BuildContext context) {
    void addUserTask(TaskClass taskclass) {
      setState(() {
        task_list.add(taskclass);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddTask(addUserTask),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Task",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: task_list.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                      title: Text(
                        task_list[index].name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        task_list[index].description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            // color: Colors.orange,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.green,
                              style: BorderStyle.solid,
                            ),
                          )))),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showUserDialog();
        },
        label: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class TaskClass {
  final String name;
  final String description;

  TaskClass(this.name, this.description);
}
