import 'package:flutter/material.dart';
import 'package:riverpod_test/page/todo/page_todo_home.dart';
import 'package:riverpod_test/widget/button/widget_rounded_button.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WidgetRoundedButton(
                  title: 'TODO',
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PageTodoHome()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
