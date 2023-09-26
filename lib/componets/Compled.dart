import 'package:flutter/material.dart';


class Compled extends StatefulWidget {
  final String title;
  final String exDate;
  final String discription;
  final Color color;
   Compled({
     required this.title,
     required this.exDate,
     required this.discription,
     required this.color}) ;

  @override
  State<Compled> createState() => _CompledState();
}

class _CompledState extends State<Compled> {

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
           padding: EdgeInsets.all(20),
          child: ListTile(
            title: Container(
                margin: const EdgeInsets.only(top:10,left: 0),
                child: Text('${widget.title}',
                  style:
                  const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight:FontWeight.bold
                ),)
            ),
            subtitle:  Container(
              margin: EdgeInsets.only(top:4,left: 0),
              child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Text('${widget.discription}',
                         style: const TextStyle(
                       fontStyle:FontStyle.normal,
                      fontSize: 15,
                      color: Colors.purple
                    ),
                    softWrap: true,
                    ),
                    Container(
                       margin: const EdgeInsets.only(top: 10),
                      child:  Text('${widget.exDate}',
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
