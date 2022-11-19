
class TailorModel {
  Meta? meta;
  List<Data>? data;

  TailorModel({this.meta, this.data});

  TailorModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? taylorId;
  String? taylorName;
  String? districtName;
  String? taylorRating;
  dynamic taylorComtrans;
  String? taylorPhoto;

  Data({this.taylorId, this.taylorName, this.districtName, this.taylorRating, this.taylorComtrans, this.taylorPhoto});

  Data.fromJson(Map<String, dynamic> json) {
    taylorId = json["taylorId"];
    taylorName = json["taylorName"];
    districtName = json["districtName"];
    taylorRating = json["taylorRating"];
    taylorComtrans = json["taylorComtrans"];
    taylorPhoto = json["taylorPhoto"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["taylorId"] = taylorId;
    _data["taylorName"] = taylorName;
    _data["districtName"] = districtName;
    _data["taylorRating"] = taylorRating;
    _data["taylorComtrans"] = taylorComtrans;
    _data["taylorPhoto"] = taylorPhoto;
    return _data;
  }
}

class Meta {
  int? code;
  String? status;
  String? message;

  Meta({this.code, this.status, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}