import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Compled extends StatefulWidget {
  final String title;
  final DateTime exDate;
  final String discription;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;
   Compled({
     required this.title,
     required this.exDate,
     required this.discription,
     required this.startTime,
     required this.endTime,
     required this.color}) ;

  @override
  State<Compled> createState() => _CompledState();
}

class _CompledState extends State<Compled> {

  String diurationTime(){
    TimeOfDay startTime = widget.startTime;
    TimeOfDay endTime = widget.endTime;

    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;

    int durationInMinutes = endMinutes - startMinutes;

    int hours = durationInMinutes ~/ 60;
    int minutes = durationInMinutes % 60;
    TimeOfDay duration = TimeOfDay(hour: hours, minute: minutes);

    return "Day:${duration.hour ~/60}/hour:${duration.hour%60}/mit:${duration.minute}";

  }

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
    return Card(
      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20),
      ),
        color: Colors.white,
        margin: EdgeInsets.only(left:14,top: 20),
        elevation: 5,

      child: Container(
        width: 350,
        height: 150,
        child: Padding(
           padding: const EdgeInsets.all(20),
          child: ListTile(
            title: Container(
                margin: const EdgeInsets.only(top:10,left: 0),
                child: Text('${widget.title}',
                  style:
                  const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight:FontWeight.bold
                ),)
            ),
            subtitle:  Container(
              margin: EdgeInsets.only(top:4,left: 0),
              child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Text('Start:${convertTimeOfDayToString(widget.startTime)} End:${convertTimeOfDayToString(widget.endTime)}',
                         style: const TextStyle(
                           fontStyle:FontStyle.normal,
                            fontSize: 12,
                             color: Colors.purple,
                             fontWeight: FontWeight.w800
                         ),
                           softWrap: true,
                    ),
                    Container(
                       margin: const EdgeInsets.only(top:5),
                      child:  Text(DateFormat.yMMMd().format(widget.exDate).toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.purple,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top:5),
                      child:  Text("${diurationTime()}",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.purple,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),

                  ]),
            ),
            trailing:  CircleAvatar(
                   backgroundColor:widget.color,
                   radius: 30,
                   child: Icon(Icons.offline_pin,size: 30,color: Colors.white,),

            ),
            // trailing: Container(
            //   width: 30,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.purple,
            //   ),
            // ),


          ),
        ),
      ),
      // child: Container(
      //      width: 350,
      //      height: 150,
      //    child:   const Row(
      //      children: [
      //        Padding(
      //           padding:EdgeInsets.all(20),
      //          child: Column(
      //            crossAxisAlignment: CrossAxisAlignment.center,
      //            children: [
      //              Expanded(
      //                child: CircleAvatar(
      //                    backgroundColor: Colors.amberAccent,
      //                   radius: 30,
      //                      child: Icon(Icons.offline_pin,color: Colors.white)
      //
      //                ),
      //              )
      //            ],
      //          ),
      //        ),
      //
      //      ]
      //   )
      //
      // )
    );
  }
}
