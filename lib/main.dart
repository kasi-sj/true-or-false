import 'package:flutter/material.dart';
import 'quezz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> mylist = [];
  String que = Quezz().nextquestion();
  bool ans = Quezz().nextanswer();

  change(bool val) {
    setState(
      () {
        int no = Quezz().incremenT();
        String que = Quezz().nextquestion();
        bool ans = Quezz().nextanswer();
        if (no == 1) {
          mylist.clear();
        }
        if (ans == val) {
          mylist.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          mylist.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Quizzer')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      Quezz().nextquestion(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  child: Column(
                    children: [
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          change(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            color: const Color.fromARGB(255, 9, 255, 0),
                            child: const Center(
                                child: Text(
                              'TRUE',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      )),
                      Expanded(
                          child: TextButton(
                        onPressed: () {
                          change(false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            color: const Color.fromARGB(255, 255, 0, 0),
                            child: const Center(
                                child: Text(
                              'FALSE',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              child: Row(
                                children: (mylist),
                              )))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
