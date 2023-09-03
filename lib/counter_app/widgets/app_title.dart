import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.remove,
          color: Colors.redAccent,
          size: 30,
        ),
        Text(
          'Enhanced Counter App!!',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Icon(
          Icons.add,
          color: Colors.lightGreen,
          size: 30,
        ),
      ],
    );
  }
}
