import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  double Width;
   UserInput(this.Width);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: widget.Width-50,
      height: 60,
      margin: const EdgeInsets.only(left: 25,top:25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: const TextField(
        onChanged: null,
        style: TextStyle(color: Colors.purple),
        cursorColor: Colors.purple,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: 'Enter your Title',
            hintStyle: TextStyle(color: Colors.purple),
            border: InputBorder.none,
            prefixIcon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.note_alt,
                color: Colors.purple,
              ),
            )),
      ),
    );
  }
}
