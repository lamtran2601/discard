import 'package:any_manage/template_widget/template_widget_list.dart';
import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TemplateWidgetList(),
      ],
    ));
  }
}
