import 'package:flutter/material.dart';
import './model/DataArray.dart';
import './model/Todos.dart';
import './componets/Compled.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<Home> {

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
                   color:DATA_TODOS[index].color
               )

           );

         });
    // return ListView.builder(
    //   itemCount: toDoList.length,
    //   padding: const EdgeInsets.symmetric(vertical: 16),
    //   itemBuilder: (BuildContext context, int index) {
    //     return Dismissible(
    //         direction: DismissDirection.endToStart,
    //         background: Container(
    //           alignment: AlignmentDirectional.centerEnd,
    //           color: Colors.red,
    //           child: const Padding(
    //             padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
    //             child: Icon(
    //               Icons.delete,
    //               color: Colors.white,
    //             ),
    //           ),
    //         ),
    //         key: ValueKey<int>(toDoList[index].hashCode),
    //         onDismissed: (DismissDirection direction) {
    //           setState(() {
    //             toDoList.removeAt(index);
    //           });
    //         },
    //        child: ,
    //         // child: Card(
    //         //   elevation: 5,
    //         //   child: Container(
    //         //     height: 200,
    //         //     width: 400,
    //         //     padding: const EdgeInsets.all(32),
    //         //     decoration: BoxDecoration(
    //         //       color: Color(0xFF846AFF),
    //         //       // gradient: const LinearGradient(
    //         //       //   begin: Alignment.topLeft,
    //         //       //   end: Alignment.bottomRight,
    //         //       //   colors: [
    //         //       //     Color(0xFF846AFF),
    //         //       //     Color(0xFF755EE8),
    //         //       //     Colors.purpleAccent,
    //         //       //     Colors.amber,
    //         //       //   ],
    //         //       // ),
    //         //       borderRadius: BorderRadius.circular(10.0),
    //         //     ),
    //         //     child: Column(
    //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //       crossAxisAlignment: CrossAxisAlignment.start,
    //         //       children: [
    //         //         Column(
    //         //           crossAxisAlignment: CrossAxisAlignment.start,
    //         //           children: [
    //         //             Row(
    //         //               children: [
    //         //                 Text('Family Card'),
    //         //                 const Spacer(),
    //         //                 Stack(
    //         //                   children: List.generate(
    //         //                     2,
    //         //                     (index) => Container(
    //         //                       margin: EdgeInsets.only(
    //         //                           left: (15 * index).toDouble()),
    //         //                       height: 30,
    //         //                       width: 30,
    //         //                       decoration: BoxDecoration(
    //         //                           borderRadius: BorderRadius.circular(10.0),
    //         //                           color: Colors.white54),
    //         //                     ),
    //         //                   ),
    //         //                 )
    //         //               ],
    //         //             ),
    //         //             Text('4111 7679 8689 9700')
    //         //           ],
    //         //         ),
    //         //         const Text('\$3,000',
    //         //             style: TextStyle(fontSize: 24, color: Colors.white))
    //         //       ],
    //         //     ),
    //         //   ),
    //         // )
    //         );
    //   },
    // );
  }
}
