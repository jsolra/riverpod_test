import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/block/model_member.dart';
import 'package:riverpod_test/page/block/page_block_member_detail.dart';
import 'package:riverpod_test/provider/block/provider_block.dart';

class WidgetMemberTile extends ConsumerWidget {
  const WidgetMemberTile({super.key, required this.data});

  final ModelMember data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageBlockMemberDetail(data: data)));
      },
      child: Container(
        color: (data.isBlock ?? false) ? Colors.black12 : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(children: [
          Expanded(
            child: Text(
              data.nickname ?? '',
              style: TextStyle(fontSize: 17),
            ),
          ),
          if (data.isBlock ?? false)
            Text(
              '(Blocked)',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
        ]),
      ),
    );
  }
}
