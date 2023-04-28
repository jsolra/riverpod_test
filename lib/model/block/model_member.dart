class ModelMember {
  int? seq;
  String? nickname;
  bool? isBlock;

  ModelMember({this.seq, this.nickname, this.isBlock});

  ModelMember.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    nickname = json['nickname'];
    isBlock = json['isBlock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['nickname'] = this.nickname;
    data['isBlock'] = this.isBlock;
    return data;
  }
}
