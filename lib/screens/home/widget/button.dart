import 'package:flutter/material.dart';

Widget button(
  VoidCallback onTap, {
  required String title,
  required Color color,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    ),
  );
}
