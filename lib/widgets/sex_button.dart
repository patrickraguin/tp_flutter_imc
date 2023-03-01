import 'package:flutter/material.dart';

class SexButton extends StatelessWidget {
  const SexButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
              isSelected ? Colors.white : Colors.black),
          backgroundColor: MaterialStateProperty.all(
              isSelected ? Colors.cyan : Colors.white)),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
