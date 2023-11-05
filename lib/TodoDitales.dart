import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TodoDitales extends StatefulWidget {
  final String title;
  final DateTime exDate;
  final String discription;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;

  TodoDitales({
    required this.title,
    required this.exDate,
    required this.discription,
    required this.startTime,
    required this.endTime,
    required this.color});

  @override
  State<TodoDitales> createState() => _TodoDitalesState();
}

class _TodoDitalesState extends State<TodoDitales> {

  String convertTimeOfDayToString(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.purple,
            title: const Text("Todo List",
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
         ),
        body:Card(
          color: Colors.green,
          elevation: 3,
          margin: EdgeInsets.only(top: 40,left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Customize the border radius as needed
          ),
          child: Container(
             margin: const EdgeInsets.only(top:10),
            width: 350,
            height: 500,
            child:Column(
              children: [
                 Container(
                  // width: screenWidth,
                   height: 50,
                 //  color: Colors.white,
                   child: Center(
                     child: Text(
                       "${widget.title}",style: const TextStyle(
                         fontSize:28,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),

                    Container(
                      width:screenWidth-100,
                      height: 300,
                      //color: Colors.purple,
                      margin: const EdgeInsets.only(top:10),
                        child: Expanded(
                          child: Text(
                           '${widget.discription}', 
                            textAlign:TextAlign.center,
                          style: const TextStyle(
                          color: Colors.black26,
                          fontSize:18,
                          ),

                    ),
                        )),
                Container(
                  margin: const EdgeInsets.only(top:10),
                   width: 350,
                    child: Row(
                      children: [
                        Container(
                          //  margin: const EdgeInsets.only(left:50),
                            child: Expanded(child: Text("Start time:${convertTimeOfDayToString(widget.startTime)}"))
                        ),
                        Container(
                         // margin: const EdgeInsets.only(left:30),
                            child: Expanded(child: Text("End Time:${convertTimeOfDayToString(widget.endTime)}"))
                        )
                      ],


                  ),
                ),
                
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                           Colors.purple
                        ),
                       textStyle: const MaterialStatePropertyAll<TextStyle>(
                          TextStyle(
                             fontSize:18,
                            fontWeight:FontWeight.w800,
                            color:Colors.white
                          )
                       ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Customize the border radius as needed
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(200, 50), // Set the width and height as needed
                        ),
                      ),
                      onPressed:null,
                      child:Text("Edite")
                  ),
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}
