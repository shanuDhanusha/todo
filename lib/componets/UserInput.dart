
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Todos.dart';
import '../model/DataArray.dart';
import '../home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../server/databaseHelpper.dart';


class UserInput extends StatefulWidget {
  double Width;
  double heigh;
  //Function func;
   UserInput(this.Width,this.heigh);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
   GlobalKey<FormState> _keyTitle=GlobalKey<FormState>();
  final GlobalKey<FormState> keyDescription=GlobalKey<FormState>();
  final GlobalKey<FormState> keyDate=GlobalKey<FormState>();
  final GlobalKey<FormState> keyStatTime=GlobalKey<FormState>();
  final GlobalKey<FormState> keyEndTime=GlobalKey<FormState>();
  final GlobalKey<FormState> keyRemainderTime=GlobalKey<FormState>();
  final GlobalKey<FormState> keyNote=GlobalKey<FormState>();

   late Todos mytodo;

     String title='';
     String discriptTodo='';
     String noteReminder='';
    DateTime _selectedDate=DateTime.now();
    TimeOfDay _selectedStartTime=TimeOfDay.now();
    TimeOfDay _selectedEndTime=TimeOfDay.now();
    String reminderTime="time";
    bool _valueBlack=false;
    bool _valueGreen=false;
    bool _valueAmban=false;


  //select date ......................................................
        Future<void> _selectDate(BuildContext context) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2050),
          );
          if (picked != null && picked != _selectedDate) {
            setState(() {
              _selectedDate = picked;
            });
          }
        }
    //...............

    // select time ..........................
      Future<void> _selectTime(BuildContext context) async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: _selectedStartTime != null ? _selectedStartTime : TimeOfDay.now(),
        );
        if (picked != null && picked != _selectedStartTime) {
          setState(() {
            _selectedStartTime = picked;
          });
        }
      }

  Future<void> _endTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedEndTime != null ? _selectedEndTime : TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }
//.....................................................

// get  remand time...............
 Widget rimenderTime(){
     final List<String> _dropdownItems =[
         '5 mitts before ',
         '10 mitts before',
         '30 mitts before',
         '1 hours before',
     ];
    return Container(
         margin: EdgeInsets.only(top: 25),
         height: 60,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.purple,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(10)

          ),
       child: DropdownButtonFormField(
         //value: reminderTime,
         style: const TextStyle(color: Colors.purple),
         items: _dropdownItems.map((String value) {
           return DropdownMenuItem<String>(
             value: value,
             child: Text(value),
           );
         }).toList(),
         onChanged: (newValue) {
           setState(() {
             reminderTime= newValue.toString();
           });
         },
         decoration: const InputDecoration(
          // labelText: 'Select an option',
           hintText: 'Select an option',
           prefixIcon: Icon(Icons.arrow_drop_down,size: 30,color: Colors.purple,),
           border: InputBorder.none,
           hintStyle: TextStyle(color: Colors.purple)
         ),
       ),
    );
 }
 Widget remainderNote(){
     return   Container(
       height: 60,
       margin: EdgeInsets.only(top: 25),
       decoration: BoxDecoration(
           border: Border.all(
               color: Colors.purple,
               width: 2
           ),
           borderRadius: BorderRadius.circular(10)

       ),
       child: TextFormField(
        // key:formKey ,
         style: const TextStyle(color: Colors.purple),
         onChanged: (value){
           setState(() {
              noteReminder=value;
           });
         },
         decoration:  const InputDecoration(
           hintText: 'Remainder Note',
           border: InputBorder.none,
           hoverColor: Colors.green,
           prefixIcon:Icon(Icons.note_alt,color: Colors.purple,size: 30,),
           hintStyle: TextStyle(color: Colors.purple),
           prefixStyle: TextStyle(color: Colors.purple),
         ),
       ),
     );
 }

 Widget getColorCode(BuildContext context){
      return Container(
         margin: EdgeInsets.only(top: 25),
            child: Row(
              children: [
                 InkWell(
                  onTap: () {
                    setState(() {
                       _valueAmban=false;
                       _valueGreen=false;
                      _valueBlack = true;
                    });
                  },

                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _valueBlack
                          ? const Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      )
                          : const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                       _valueBlack=false;
                       _valueGreen=false;
                       _valueAmban=true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amberAccent),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _valueAmban
                          ? const Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      )
                          : const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 InkWell(
                  onTap: () {
                    setState(() {
                      _valueBlack=false;
                      _valueAmban=false;
                      _valueGreen=true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _valueGreen
                          ? const Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      )
                          : const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                 ),
                Container(
                  width: 150,
                  height: 50,
                  margin: const EdgeInsets.only(left:5,top:0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: (){
                       validateData(context);
                    },
                    child: const Text('Create Todo',style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                )
              ],

            ),
      );
 }
  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          backgroundColor: Colors.purple,
             content:Container(
                margin: EdgeInsets.only(bottom:20 ),
               child: Text(
                message,
                style: const TextStyle(fontSize: 18.0,color: Colors.white),
                 softWrap: true,// Adjust the font size as needed
          ),
             ),
          duration: const Duration(seconds: 3),  // Adjust the display duration as needed
          behavior: SnackBarBehavior.floating,
        ),

    );
  }
 //validate data ...........
  void validateData(BuildContext context){
      if(title.isEmpty ||title==null){
        showToast(context,'Enter your Title');
        return;
      }
      if(title.length>25){
        showToast(context, "Title should be less  15 than character");
        return;
      }
      if(discriptTodo.isEmpty|| discriptTodo==null){
        showToast(context,'Enter your Description');
        return;
      }
      if(_selectedDate.toString().isEmpty|| _selectedDate.toString()==null){
        showToast(context,'Select Date');
        return;
      }
      if(_selectedStartTime.toString().isEmpty||_selectedStartTime.toString()==_selectedEndTime.toString()){
        showToast(context,'check Time');
        return;
      }
      if(_selectedEndTime.toString().isEmpty||_selectedEndTime.toString()==_selectedStartTime.toString()){
        showToast(context,'check Time');
        return;
      }
      if(reminderTime.isEmpty||reminderTime==null){
        showToast(context, 'check Remainder ');
        return;
      }
      if(noteReminder.isEmpty||noteReminder==null){
        showToast(context,'Enter your Note');
        return;
      }
      if(!_valueGreen && !_valueAmban && !_valueBlack){
         showToast(context,'Select Color');
         return;
      }

      setState(() {

            mytodo= Todos(
                 id:0,
                 title: title,
                 exDate:_selectedDate.toString(),
                 discription: discriptTodo,
                 startTime: _selectedStartTime.toString(),
                 endTime: _selectedEndTime.toString(),
                 notificationTime: reminderTime,
                 notificationNote: noteReminder,
               color: _valueBlack
                   ? Colors.black.value
                   : (_valueAmban
                   ? Colors.amberAccent.value
                   : (_valueGreen ? Colors.green.value : Colors.black26.value)
            ));
             databaseHelpper.addTodo(mytodo);
             showToast(context,"successfully");

      });

  }


  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        child: Container(
          width: widget.Width-50,
         // height:widget.heigh-200,
          //color: Colors.purple,
          margin: const EdgeInsets.only(left: 25,top:45),
          child:  Column(
             children: [
               Container(
                 height: 60,
                  decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.purple,
                       width: 2
                     ),
                    borderRadius: BorderRadius.circular(10)

                  ),
                 child: TextFormField(
                       key:_keyTitle ,
                       onChanged: (value){
                         setState(() {
                            title=value.toString();
                         });
                       },
                       style: const TextStyle(color: Colors.purple),
                       decoration:  const InputDecoration(
                       hintText: 'Enter your Title',
                       border: InputBorder.none,
                       hoverColor: Colors.green,
                       prefixIcon:Icon(Icons.note_alt,color: Colors.purple,size: 30,),
                       hintStyle: TextStyle(color: Colors.purple),
                       prefixStyle: TextStyle(color: Colors.purple),
                   ),
                 ),
               ),

               // for Description ..........................
               Container(
                  height: 60,
                  margin: EdgeInsets.only(top:25),
                 decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.purple,
                         width: 2
                     ),
                     borderRadius: BorderRadius.circular(10)

                 ),
                 child: TextFormField(
                   key:keyDescription ,
                   style: const TextStyle(color: Colors.purple),
                   onChanged: (value){
                     setState(() {
                         discriptTodo=value;
                     });
                   },
                   decoration:  const InputDecoration(
                     hintText: 'Enter your Description',
                     border: InputBorder.none,
                     hoverColor: Colors.green,
                     prefixIcon:Icon(Icons.note_alt,color: Colors.purple,size: 30,),
                     hintStyle: TextStyle(color: Colors.purple),
                     prefixStyle: TextStyle(color: Colors.purple),
                   ),
                 ),
               ),
               //date filed .....................................
               Container(
                 height: 60,
                 margin: EdgeInsets.only(top:25),
                 decoration: BoxDecoration(
                     border: Border.all(
                         color: Colors.purple,
                         width: 2
                     ),
                     borderRadius: BorderRadius.circular(10)

                 ),
                 child: TextFormField(
                   key:keyDate ,
                   //textAlign: TextAlign.left,
                   textAlignVertical: TextAlignVertical.center,
                   controller: TextEditingController(
                     text: _selectedDate != null
                         ? DateFormat.yMMMd().format(_selectedDate).toString()
                         : '',
                   ),
                   readOnly: true,
                   onTap:()=>_selectDate(context) ,
                   style: const TextStyle(color: Colors.purple),
                   onChanged: (value){
                      _selectedDate=value as DateTime;
                   },
                   decoration: const InputDecoration(
                     hintText: 'Enter your Description',
                     border: InputBorder.none,
                     hoverColor: Colors.green,
                     prefixIcon: Icon(Icons.calendar_month,color: Colors.purple,size: 30,),
                     hintStyle: TextStyle(color: Colors.purple),
                     prefixStyle: TextStyle(color: Colors.purple),
                   ),
                 ),
               ),

               // get Time .................................
               Container(
                 margin: EdgeInsets.only(top: 25),
                 child: Row(
                   children: [
                        Container(
                         height: 60,
                         width: ((widget.Width-50)/2)-10,
                         decoration: BoxDecoration(
                             border: Border.all(
                                 color: Colors.purple,
                                 width: 2
                             ),
                             borderRadius: BorderRadius.circular(10)

                         ),
                         child: TextFormField(
                           key:keyStatTime ,
                           readOnly: true,
                           onTap: ()=>_selectTime(context),
                           controller: TextEditingController(
                             text: _selectedStartTime != null
                                 ? _selectedStartTime.format(context)
                                 : '',
                           ),
                           style: const TextStyle(color: Colors.purple),
                           onChanged: (value){
                              setState(() {
                                 _selectedStartTime=value as TimeOfDay;
                              });
                           },
                           decoration:  const InputDecoration(
                             hintText: 'Start Time',
                             border: InputBorder.none,
                             hoverColor: Colors.green,
                             prefixIcon:Icon(Icons.timer,color: Colors.purple,size: 30,),
                             hintStyle: TextStyle(color: Colors.purple),
                             prefixStyle: TextStyle(color: Colors.purple),
                               prefixText: "Start:"
                           ),
                         ),
                       ),

                       Container(
                         height: 60,
                         width:((widget.Width-50)/2)-10,
                         margin: EdgeInsets.only(left:20),
                         decoration: BoxDecoration(
                             border: Border.all(
                                 color: Colors.purple,
                                 width: 2
                             ),
                             borderRadius: BorderRadius.circular(10)

                         ),
                         child: TextFormField(
                           key:keyEndTime,
                           readOnly: true,
                           onTap: ()=>_endTime(context),
                           controller: TextEditingController(
                             text: _selectedEndTime != null
                                 ? _selectedEndTime.format(context)
                                 : '',
                           ),
                           style: const TextStyle(color: Colors.purple),
                             onChanged: (value){
                               setState(() {
                                 _selectedEndTime=value as TimeOfDay;
                               });
                             },
                           decoration:  const InputDecoration(
                             hintText:'End Time',
                             border: InputBorder.none,
                             hoverColor: Colors.green,
                             prefixIcon:Icon(Icons.timer,color: Colors.purple,size: 30,),
                             hintStyle: TextStyle(color: Colors.purple),
                             prefixStyle: TextStyle(color: Colors.purple),
                             prefixText: "End:"
                           ),
                         ),
                       ),
                   ],
                 ),
               ),
               rimenderTime(),
               remainderNote(),
               getColorCode(context),

             ],
          )
        ),
      ),
    );
  }
}
