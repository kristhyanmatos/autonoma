import 'package:flutter/material.dart';

class ButtonNextWidget extends StatelessWidget {
  final String value;
  final void Function()? onPressed;
  const ButtonNextWidget({super.key, this.onPressed, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        onPressed: onPressed,
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
      ),
    );
  }
}
