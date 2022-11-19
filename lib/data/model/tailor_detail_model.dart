
class TailorDetailModel {
  Meta? meta;
  List<dynamic>? data;

  TailorDetailModel({this.meta, this.data});

  TailorDetailModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(data != null) {
      _data["data"] = data;
    }
    return _data;
  }
}

class Meta {
  int? code;
  String? status;
  Message? message;

  Meta({this.code, this.status, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    message = json["message"] == null ? null : Message.fromJson(json["message"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    if(message != null) {
      _data["message"] = message?.toJson();
    }
    return _data;
  }
}

class Message {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Message({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Message.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    firstPageUrl = json["first_page_url"];
    from = json["from"];
    lastPage = json["last_page"];
    lastPageUrl = json["last_page_url"];
    nextPageUrl = json["next_page_url"];
    path = json["path"];
    perPage = json["per_page"];
    prevPageUrl = json["prev_page_url"];
    to = json["to"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["first_page_url"] = firstPageUrl;
    _data["from"] = from;
    _data["last_page"] = lastPage;
    _data["last_page_url"] = lastPageUrl;
    _data["next_page_url"] = nextPageUrl;
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["prev_page_url"] = prevPageUrl;
    _data["to"] = to;
    _data["total"] = total;
    return _data;
  }
}

class Data {
  String? id;
  String? taylorId;
  String? taylorName;
  String? taylorPhoto;
  String? taylorPhone;
  String? dateBirth;
  String? placeBirth;

  Data({this.id, this.taylorId, this.taylorName, this.taylorPhoto, this.taylorPhone, this.dateBirth, this.placeBirth});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    taylorId = json["taylor_id"];
    taylorName = json["taylor_name"];
    taylorPhoto = json["taylor_photo"];
    taylorPhone = json["taylor_phone"];
    dateBirth = json["date_birth"];
    placeBirth = json["place_birth"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["taylor_id"] = taylorId;
    _data["taylor_name"] = taylorName;
    _data["taylor_photo"] = taylorPhoto;
    _data["taylor_phone"] = taylorPhone;
    _data["date_birth"] = dateBirth;
    _data["place_birth"] = placeBirth;
    return _data;
  }
}