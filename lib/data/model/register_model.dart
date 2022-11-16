/// meta : {"code":201,"status":"success","message":"user berhasil mendaftar"}
/// data : []

class RegisterModel {
  RegisterModel({
      Meta? meta, 
      List<dynamic>? data,}){
    _meta = meta;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Dynamic.fromJson(v));
      });
    }
  }
  Meta? _meta;
  List<dynamic>? _data;
RegisterModel copyWith({  Meta? meta,
  List<dynamic>? data,
}) => RegisterModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  List<dynamic>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : 201
/// status : "success"
/// message : "user berhasil mendaftar"

class Meta {
  Meta({
      num? code, 
      String? status, 
      String? message,}){
    _code = code;
    _status = status;
    _message = message;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
  }
  num? _code;
  String? _status;
  String? _message;
Meta copyWith({  num? code,
  String? status,
  String? message,
}) => Meta(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
);
  num? get code => _code;
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}