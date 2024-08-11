import 'package:flutter/material.dart';

Text myText(String data, {double fontSize = 32}) {
  return Text(
    data,
    style: TextStyle(
      fontSize: fontSize,
    ),
  );
}

ElevatedButton elevatedButton({
  required String textBtn,
  required void Function()? onPressed
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.orange,
      minimumSize: const Size(150, 50),
    ),
    onPressed: onPressed,
    child: Text(
      textBtn,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
  );
}
