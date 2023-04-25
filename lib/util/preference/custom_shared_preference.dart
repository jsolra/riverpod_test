import 'dart:convert';

import 'package:riverpod_test/model/model_todo.dart';
import 'package:riverpod_test/util/preference/shared_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  CustomSharedPreferences._privateConstructor();
  static final CustomSharedPreferences _instance =
      CustomSharedPreferences._privateConstructor();

  ///Singletone
  factory CustomSharedPreferences() {
    return _instance;
  }
  late SharedPreferences sp;

  Future<void> getInstance() async {
    sp = await SharedPreferences.getInstance();
  }

  Future<void> put(String key, dynamic data) async {
    if (data is String) {
      await sp.setString(key, data);
    } else if (data is int) {
      await sp.setInt(key, data);
    } else if (data is bool) {
      await sp.setBool(key, data);
    } else if (data is double) {
      await sp.setDouble(key, data);
    } else {}
  }

  int getLastTodoSeq() {
    return sp.getInt(SharedPreferenceKey.lastTodoSeq) ?? -1;
  }

  void setLastTodoSeq(int seq) async {
    await put(SharedPreferenceKey.lastTodoSeq, seq);
  }

  List<ModelTodo> getTodoList() {
    String? resultString = sp.getString(SharedPreferenceKey.todoList);
    if (resultString == null) return [];

    try {
      List<dynamic> result = json.decode(resultString);
      List<ModelTodo> todoList = [];
      result.forEach((value) {
        todoList.add(ModelTodo.fromJson(value));
      });

      return todoList;
    } catch (e) {
      return [];
    }
  }

  void setTodoList(List<ModelTodo> list) async {
    List<String> _todoList = [];
    for (var _data in list) {
      _todoList.add(_data.toJson().toString());
    }

    await put(SharedPreferenceKey.todoList, json.encode(list));
  }
}
