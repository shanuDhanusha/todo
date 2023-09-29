import 'package:flutter/material.dart';
import './componets/Compled.dart';
import './model/DataArray.dart';
import './model/Todos.dart';

class Finished extends StatefulWidget {
  const Finished({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Finished createState() => _Finished();
}

class _Finished extends State<Finished> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       scrollDirection: Axis.vertical,
        itemCount: DATA_TODOS.length,
        padding: EdgeInsets.all(20),
        itemBuilder:(context,index){
              return Dismissible(
                  key:ValueKey<String>(DATA_TODOS[index].title),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      DATA_TODOS.removeAt(index);
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
                  title:DATA_TODOS[index].title,
                  exDate:DATA_TODOS[index].exDate,
                  discription:DATA_TODOS[index].discription,
                  startTime: DATA_TODOS[index].startTime,
                  endTime: DATA_TODOS[index].endTime,
                  color:DATA_TODOS[index].color,

                )

              );

        });
  }
}
