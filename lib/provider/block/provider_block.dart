import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/block/model_member.dart';

class ProviderBlock extends ChangeNotifier {
  ProviderBlock() {
    //멤버데이터 기본값 삽입
    setMemberList();
  }
  final List<ModelMember> memberList = [];

  final List<int> blockedMemberSeqList = [];

  ///user block or unblock
  void onBlockMember(int memberSeq, bool blockState) {
    if (blockState) {
      _addBlockMember(memberSeq);
    } else {
      _removeBlockMember(memberSeq);
    }

    int? seekedIndex = _seekMemberIndex(memberSeq);
    if (seekedIndex == null) return;
    memberList[seekedIndex].isBlock = blockState;
    notifyListeners();
  }

  ///memberSeq로 list index 찾기
  int? _seekMemberIndex(int memberSeq) {
    for (int i = 0; i < memberList.length; i++) {
      if (memberList[i].seq == memberSeq) {
        return i;
      }
    }
    return null;
  }

  ///차단한 멤버 리스트에서 삭제
  void _removeBlockMember(int memberSeq) {
    for (int i = 0; i < blockedMemberSeqList.length; i++) {
      if (blockedMemberSeqList[i] == memberSeq) {
        blockedMemberSeqList.removeAt(i);
        break;
      }
    }
  }

  ///차단한 멤버 리스트에 추가
  void _addBlockMember(int seq) {
    if (!blockedMemberSeqList.contains(seq)) {
      blockedMemberSeqList.add(seq);
    }
  }

  ///block 리스트 설정
  void setMemberList() {
    memberList.clear();

    memberList.addAll(
      [
        ModelMember(seq: 0, nickname: 'jenny', isBlock: false),
        ModelMember(seq: 1, nickname: 'john', isBlock: false),
        ModelMember(seq: 2, nickname: 'kelly', isBlock: false),
        ModelMember(seq: 3, nickname: 'emma', isBlock: false),
        ModelMember(seq: 4, nickname: 'alex', isBlock: false),
        ModelMember(seq: 5, nickname: 'lisa', isBlock: false),
        ModelMember(seq: 6, nickname: 'david', isBlock: false),
        ModelMember(seq: 7, nickname: 'roze', isBlock: false),
        ModelMember(seq: 8, nickname: 'daniel', isBlock: false),
        ModelMember(seq: 9, nickname: 'alan', isBlock: false),
        ModelMember(seq: 10, nickname: 'dorothy', isBlock: false),
        ModelMember(seq: 11, nickname: 'edward', isBlock: false),
      ],
    );

    notifyListeners();
  }
}

final blockProvider = ChangeNotifierProvider<ProviderBlock>((ref) {
  return ProviderBlock();
});
