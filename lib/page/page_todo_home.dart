import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/model_todo.dart';
import 'package:riverpod_test/page/page_todo_all.dart';
import 'package:riverpod_test/provider/provider_todo.dart';

class PageTodoHome extends ConsumerStatefulWidget {
  const PageTodoHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageTodoHomeState();
}

class _PageTodoHomeState extends ConsumerState<PageTodoHome> {
  int screenIndex = 0;

  List<Widget> _tabList = [
    PageTodoAll(),
    PageTodoAll(),
    PageTodoAll(),
  ];

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
    return FloatingActionButton(onPressed: () {
      ref.read(todoProvider).addData(ModelTodo(content: '테스트내용', state: false));
      log('add data!');
    });
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
