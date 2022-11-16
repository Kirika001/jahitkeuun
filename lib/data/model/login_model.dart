
class LoginModel {
  Meta? meta;
  Data? data;

  LoginModel({this.meta, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? token;
  String? nama;
  String? email;
  String? role;
  String? image;
  Client? client;
  dynamic admin;
  dynamic taylor;
  dynamic convection;

  Data({this.token, this.nama, this.email, this.role, this.image, this.client, this.admin, this.taylor, this.convection});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    nama = json["nama"];
    email = json["email"];
    role = json["role"];
    image = json["image"];
    client = json["client"] == null ? null : Client.fromJson(json["client"]);
    admin = json["admin"];
    taylor = json["taylor"];
    convection = json["convection"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["nama"] = nama;
    _data["email"] = email;
    _data["role"] = role;
    _data["image"] = image;
    if(client != null) {
      _data["client"] = client?.toJson();
    }
    _data["admin"] = admin;
    _data["taylor"] = taylor;
    _data["convection"] = convection;
    return _data;
  }
}

class Client {
  int? id;
  dynamic photo;
  dynamic phone;
  dynamic dateBirth;
  dynamic placeBirth;
  String? status;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Client({this.id, this.photo, this.phone, this.dateBirth, this.placeBirth, this.status, this.userId, this.createdAt, this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    photo = json["photo"];
    phone = json["phone"];
    dateBirth = json["dateBirth"];
    placeBirth = json["placeBirth"];
    status = json["status"];
    userId = json["user_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["photo"] = photo;
    _data["phone"] = phone;
    _data["dateBirth"] = dateBirth;
    _data["placeBirth"] = placeBirth;
    _data["status"] = status;
    _data["user_id"] = userId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
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