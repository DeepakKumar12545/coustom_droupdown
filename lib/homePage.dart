import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> droupDownList = [
    {"title": "BCA", "value": "1"},
    {"title": "BBA", "value": "2"},
    {"title": "MTCH", "value": "3"},
    {"title": "MCA", "value": "4"},
    {"title": "DCA", "value": "5"}
  ];

  String? valueSet; // Set initial value to null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dropdown"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          InputDecorator(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Colors.white,
                value: valueSet,
                isExpanded: true,
                menuMaxHeight: 350,
                hint: const Text("Select a course"),
                items: droupDownList.map<DropdownMenuItem<String>>((data) {
                  return DropdownMenuItem<String>(
                    value: data['value'],
                    child: Text(
                      data['title']!,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    valueSet = value;
                  });
                  print("Selected value: $value");
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (valueSet == null) {
                    Fluttertoast.showToast(
                        msg: "Plese Select the Course",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Yes you selected the course",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                });
              },
              child: Text("submit"))
        ],
      ),
    );
  }
}
