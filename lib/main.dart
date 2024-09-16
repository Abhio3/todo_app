import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String a = "no text data";
  List<String> tasklist = [];
  TextEditingController textcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text("Todo List App"),
              backgroundColor: Colors.blue,
              centerTitle: false,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textcontroler,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter the task"),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      tasklist.add(textcontroler.text);
                      textcontroler.clear();
                    });
                  },
                  child: Text("add"),
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: tasklist.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(tasklist[index]),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            tasklist.removeAt(index);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
