import 'package:flutter/material.dart';
import './componets/UserInput.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _New createState() => _New();
}

class _New extends State<New> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width=screenSize.width;
    double height=screenSize.height;
    return  UserInput(width,height);

  }
}
