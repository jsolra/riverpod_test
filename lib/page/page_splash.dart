import 'package:flutter/material.dart';
import 'package:riverpod_test/page/page_todo_home.dart';
import 'package:riverpod_test/util/preference/custom_shared_preference.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({super.key});

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    await CustomSharedPreferences().getInstance();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PageTodoHome()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
