import 'package:flutter/material.dart';

class TemplateWidgetList extends StatelessWidget {
  const TemplateWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Column'),
        Text('Row'),
        Text('Container'),
        Text('Text'),
      ],
    );
  }
}
