import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/todo/model_todo.dart';
import 'package:riverpod_test/provider/todo/provider_todo.dart';
import 'package:riverpod_test/widget/todo/widget_todo.dart';

class PageTodoDone extends ConsumerWidget {
  const PageTodoDone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModelTodo> todoList = ref.watch(todoProvider).todoDoneList;
    return ListView.separated(
      itemCount: todoList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return WidgetTodo(
          data: todoList[index],
        );
      },
    );
  }
}
