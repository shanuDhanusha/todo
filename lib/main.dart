// ignore_for_file: no_logic_in_create_state
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_todo/Finished.dart';
import 'package:project_todo/home.dart';
import 'package:project_todo/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    New(),
    Finished(),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      ),
      home: Scaffold(
        appBar: _selectedIndex!=1
            ? AppBar(
          backgroundColor: Colors.purple,
          bottom: PreferredSize(
            preferredSize: Size(0, 10),
            child: Container(
              //color: Colors.white,
              child: Center(
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: const TextField(
                    onChanged: null,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ):AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Add your Todo',
               style: TextStyle(
                 fontSize: 18,
                 color: Colors.white
               ),
          ),
          leading: const Icon(
            Icons.edit_note_sharp,
            size: 40,
            color: Colors.white,
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex), //body widget
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.purple,
          height: 70,
          index: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            Icon(
              Icons.home_filled,
              size: 25,
              color: Colors.black,
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              hoverColor: Colors.purple,
              onPressed: null,
              child: Icon(
                Icons.add,
                size: 25,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.contact_page_rounded,
              size: 25,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
