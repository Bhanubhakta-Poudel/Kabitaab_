import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.yellow[600],
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Center(
          child: Text(
        "EXPLORE POEMS",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
