import 'package:flutter/material.dart';

class FloatButtonCustom extends StatefulWidget {
  final VoidCallback onPressed;

  const FloatButtonCustom({super.key, required this.onPressed});

  @override
  State<FloatButtonCustom> createState() => _FloatButtonCustomState();
}

class _FloatButtonCustomState extends State<FloatButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text(
        'Favoritar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(Icons.star, color: Colors.white),
      backgroundColor: Colors.indigo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
