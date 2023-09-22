import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  final IconData icon;
  final bool isOn;
  final VoidCallback onItemPressed;
  final Color activatedColor;
  final String title;

  const WeatherItem({
    required this.icon,
    required this.isOn,
    required this.onItemPressed,
    required this.activatedColor,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isOn ? activatedColor : Colors.grey,
        ),
        SizedBox(width: 24),
        Expanded(
          child: Text(title),
        ),
        IconButton(
          onPressed: onItemPressed,
          icon: Icon(
            Icons.arrow_right,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
