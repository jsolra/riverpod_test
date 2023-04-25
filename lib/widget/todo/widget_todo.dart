import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/model_todo.dart';
import 'package:riverpod_test/provider/provider_todo.dart';

class WidgetTodo extends ConsumerWidget {
  const WidgetTodo({super.key, required this.data});
  final ModelTodo data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProviderTodo _todoProvider = ref.read(todoProvider);
    return CheckboxListTile(
        value: data.state,
        title: Text(data.content),
        onChanged: (value) {
          data.state = value!;
          _todoProvider.putData(data.seq, data);
        });
  }
}
