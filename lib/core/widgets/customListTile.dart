import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date});
  final String title;
  final String subtitle;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: AutoDirection(
            text: title,
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
        subtitle: Row(
          children: [
            Text(
              subtitle,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const Spacer(),
            Text(date,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
          ],
        ),
      ),
    );
  }
}
