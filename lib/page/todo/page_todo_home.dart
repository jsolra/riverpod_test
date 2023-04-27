import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/dialog/text_input_dialog.dart';
import 'package:riverpod_test/model/todo/model_todo.dart';
import 'package:riverpod_test/page/todo/page_todo_all.dart';
import 'package:riverpod_test/page/todo/page_todo_done.dart';
import 'package:riverpod_test/page/todo/page_todo_inprogress.dart';
import 'package:riverpod_test/provider/todo/provider_todo.dart';

class PageTodoHome extends ConsumerStatefulWidget {
  const PageTodoHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageTodoHomeState();
}

class _PageTodoHomeState extends ConsumerState<PageTodoHome> {
  int screenIndex = 0;

  final List<Widget> _tabList = [
    PageTodoAll(),
    PageTodoInprogress(),
    PageTodoDone(),
  ];

  void onFABEvent() {
    TextInputDialog(context, (value) {
      if (value == '') return;
      ref.read(todoProvider).addData(ModelTodo(content: value, state: false));
      log('add data!');
    });
  }

  Widget widgetGNB() {
    return BottomNavigationBar(
      currentIndex: screenIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check), label: '전체'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '대기'),
        BottomNavigationBarItem(icon: Icon(Icons.check), label: '완료')
      ],
      onTap: (value) {
        setState(() {
          screenIndex = value;
        });
      },
    );
  }

  Widget widgetFAB() {
    return FloatingActionButton(child: Icon(Icons.add), onPressed: onFABEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do'),
      ),
      body: _tabList[screenIndex],
      bottomNavigationBar: widgetGNB(),
      floatingActionButton: widgetFAB(),
    );
  }
}
