import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/block/model_member.dart';
import 'package:riverpod_test/provider/block/provider_block.dart';
import 'package:riverpod_test/widget/block/widget_member_tile.dart';

class PageBlockHome extends ConsumerWidget {
  const PageBlockHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModelMember> memberList = ref.watch(blockProvider).memberList;
    return Scaffold(
      appBar: AppBar(
        title: Text('block'),
      ),
      body: ListView.separated(
        itemCount: memberList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Colors.black87,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return WidgetMemberTile(data: memberList[index]);
        },
      ),
    );
  }
}
