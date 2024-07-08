import 'package:flutter/material.dart';

import 'action_button.dart';

class NoProduct extends StatelessWidget {
  final VoidCallback onPress;
  const NoProduct({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text('No product has been added yet. Please try again'),
        ),
        ActionButton(
          onPress: onPress,
          title: 'Try again',
        )
      ],
    );
  }
}
