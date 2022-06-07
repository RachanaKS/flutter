class Get {
  String? sId;
  String? name;
  String? update;
  int? iV;

  Get({this.sId, this.name, this.update, this.iV});

  Get.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    update = json['update'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['update'] = this.update;
    data['__v'] = this.iV;
    return data;
  }
}
