
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './model/DataArray.dart';
import './model/Todos.dart';
import './componets/Compled.dart';
import './componets/UserInput.dart';
import './server/databaseHelpper.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  late List<Todos> todosList=[];

  @override
  void initState() {
    super.initState();
    // Initialize and retrieve data from the database
    loadTodos();
  }

  Future<void> loadTodos() async {
    // Replace 'YourDatabaseHelper()' with the appropriate instance of your database helper
    //todosList = (await databaseHelpper.getTodo())!;
    setState(() {});
  }

  TimeOfDay parseTimeOfDayFromString(String timeString) {
    // Extract the time part from the string, e.g., "00:15"
    final timePart = timeString.substring(timeString.indexOf('(') + 1, timeString.indexOf(')'));

    // Split the time part into hours and minutes
    final timeParts = timePart.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);

    return TimeOfDay(hour: hours, minute: minutes);
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: todosList.length,
        padding: EdgeInsets.all(20),
        itemBuilder:(context,index){
          return Dismissible(
              key:ValueKey<String>(todosList[index].id.toString()),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  //DATA_TODOS.removeAt(index);
                });
              },
              background: Container(
                // color: Colors.green,
                alignment: AlignmentDirectional.centerEnd,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
                // padding: EdgeInsets.all(20),
              ),
              child :Compled(
                title:todosList[index].title,
                exDate:DateTime.parse(todosList[index].exDate ) ,
                discription:todosList[index].discription,
                startTime:parseTimeOfDayFromString(todosList[index].startTime),
                endTime:parseTimeOfDayFromString(todosList[index].endTime),
                color:Color(todosList[index].color),

              )

          );

        });
  }
}
