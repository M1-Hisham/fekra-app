import 'package:flutter/material.dart';

AppBar appBar({bool showMenuIcon = false}) {
  return AppBar(
    title: const Text(
      'فكرة',
      style: TextStyle(
        color: Color(0xFF079668),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: showMenuIcon
        ? Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu_rounded, size: 25),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )
        : null,
  );
}
