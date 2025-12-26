import 'package:flutter/material.dart';

Widget cardView({String? icon, String? title, String? description}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(icon, color: Colors.green, size: 40),
            Text(icon ?? '', style: TextStyle(fontSize: 40)),
            SizedBox(height: 8),
            Text(
              title!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              description!,
              style: TextStyle(color: Colors.grey[700], fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
