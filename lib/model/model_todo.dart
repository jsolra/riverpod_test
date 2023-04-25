class ModelTodo {
  late int seq;
  late String content;
  late bool state;

  ModelTodo({this.seq = -1, required this.content, required this.state});

  ModelTodo.fromJson(Map<String, dynamic> json) {
    seq = json['seq'] ?? -1;
    content = json['content'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['content'] = this.content;
    data['state'] = this.state;
    return data;
  }
}
