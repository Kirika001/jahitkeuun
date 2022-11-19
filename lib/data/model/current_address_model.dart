
class CurrentAddressModel {
  Meta? meta;
  List<Data>? data;

  CurrentAddressModel({this.meta, this.data});

  CurrentAddressModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? alamatId;
  String? jenisAlamat;
  String? alamat;

  Data({this.userId, this.alamatId, this.jenisAlamat, this.alamat});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    alamatId = json["alamatId"];
    jenisAlamat = json["jenisAlamat"];
    alamat = json["alamat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["alamatId"] = alamatId;
    _data["jenisAlamat"] = jenisAlamat;
    _data["alamat"] = alamat;
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