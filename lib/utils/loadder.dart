import 'package:flutter/material.dart';

class Loadder extends StatelessWidget {
  final String? msg;
  const Loadder({Key? key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(color: Colors.pinkAccent)),
        const SizedBox(height: 10),
        Text(msg ?? "",style: const TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
