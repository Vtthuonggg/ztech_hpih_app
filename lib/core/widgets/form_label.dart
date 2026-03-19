import 'package:flutter/material.dart';

class RequiredStar extends StatelessWidget {
  const RequiredStar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '*',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class FormSectionLabel extends StatelessWidget {
  const FormSectionLabel({
    super.key,
    required this.title,
    this.required = false,
  });

  final String title;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
        ),
        if (required) const RequiredStar(),
      ],
    );
  }
}
