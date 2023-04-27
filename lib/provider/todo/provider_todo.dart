import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/todo/model_todo.dart';
import 'package:riverpod_test/util/preference/custom_shared_preference.dart';

class ProviderTodo extends ChangeNotifier {
  ProviderTodo() {
    setList(CustomSharedPreferences().getTodoList());
  }
  final List<ModelTodo> todoList = [];

  List<ModelTodo> get todoInprogressList {
    return _getStateList(false);
  }

  List<ModelTodo> get todoDoneList {
    return _getStateList(true);
  }

  List<ModelTodo> _getStateList(bool state) {
    List<ModelTodo> list = [];
    for (ModelTodo data in todoList) {
      if (data.state == state) {
        list.add(data);
      }
    }
    return list;
  }

  void _saveDataInStorage() {
    CustomSharedPreferences().setTodoList(todoList);
  }

  int? seekIndex(int seq) {
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i].seq == seq) {
        return i;
      }
    }
  }

  ///todo 데이터 추가
  void addData(ModelTodo data) {
    data.seq = CustomSharedPreferences().getLastTodoSeq() + 1;

    todoList.add(data);
    notifyListeners();
    _saveDataInStorage();
    CustomSharedPreferences().setLastTodoSeq(data.seq);
  }

  ///todo 리스트 설정
  void setList(List<ModelTodo> data) {
    todoList.clear();
    todoList.addAll(data);
    notifyListeners();
  }

  ///todo 데이터 수정
  void putData(int seq, ModelTodo data) {
    int? seekedIndex = seekIndex(seq);
    if (seekedIndex == null) return;
    todoList[seekedIndex] = data;
    _saveDataInStorage();
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider<ProviderTodo>((ref) {
  return ProviderTodo();
});
