import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/block/model_member.dart';
import 'package:riverpod_test/provider/block/provider_block.dart';
import 'package:riverpod_test/widget/button/widget_rounded_button.dart';

class PageBlockMemberDetail extends ConsumerWidget {
  const PageBlockMemberDetail({super.key, required this.data});
  final ModelMember data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.nickname ?? ''}\'s page'),
        backgroundColor: (data.isBlock ?? false) ? Colors.grey : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi, I\'m ${data.nickname ?? ''} :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 60),
            WidgetRoundedButton(
                title: (data.isBlock ?? false) ? 'unblock' : 'block',
                ontap: () {
                  if (data.seq != null)
                    ref
                        .watch(blockProvider)
                        .onBlockMember(data.seq!, !(data.isBlock ?? false));
                })
          ],
        ),
      ),
    );
  }
}
