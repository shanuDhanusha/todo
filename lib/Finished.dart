import 'package:flutter/material.dart';

class Finished extends StatefulWidget {
  const Finished({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Finished createState() => _Finished();
}

class _Finished extends State<Finished> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Finished!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
