import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _New createState() => _New();
}

class _New extends State<New> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Add new',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
