/// meta : {"code":200,"status":"success","message":"list data taylor"}
/// data : {"current_page":1,"data":[{"taylorId":"1","taylorName":"Taylor Jada Bauch","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"2","taylorName":"Taylor Shayna Goodwin","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"3","taylorName":"Taylor Angelina Jones","districtName":"BANDUNG KULON","taylorRating":"2","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"4","taylorName":"Taylor Charity Turcotte","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"5","taylorName":"Taylor Bertrand Greenfelder","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"6","taylorName":"Taylor Amari Leannon","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"7","taylorName":"Taylor Pearlie Reinger DDS","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"8","taylorName":"Taylor Edgardo Frami","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"9","taylorName":"Taylor Gage Baumbach","districtName":"BANDUNG KULON","taylorRating":"4","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"10","taylorName":"Taylor Leanne Goodwin PhD","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"11","taylorName":"Taylor Eino Bergstrom","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"12","taylorName":"Taylor Name Auer MD","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"13","taylorName":"Taylor Tracy Steuber DDS","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"14","taylorName":"Taylor Johan Hettinger DDS","districtName":"BANDUNG KULON","taylorRating":"0","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"15","taylorName":"Taylor Wilma Connelly","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"}],"first_page_url":"https://apijahitkeeun.tepat.co.id/api/taylor?page=1","from":1,"last_page":5,"last_page_url":"https://apijahitkeeun.tepat.co.id/api/taylor?page=5","next_page_url":"https://apijahitkeeun.tepat.co.id/api/taylor?page=2","path":"https://apijahitkeeun.tepat.co.id/api/taylor","per_page":15,"prev_page_url":null,"to":15,"total":68}

class TailorModel {
  TailorModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  TailorModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
TailorModel copyWith({  Meta? meta,
  Data? data,
}) => TailorModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// current_page : 1
/// data : [{"taylorId":"1","taylorName":"Taylor Jada Bauch","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"2","taylorName":"Taylor Shayna Goodwin","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"3","taylorName":"Taylor Angelina Jones","districtName":"BANDUNG KULON","taylorRating":"2","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"4","taylorName":"Taylor Charity Turcotte","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"5","taylorName":"Taylor Bertrand Greenfelder","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"6","taylorName":"Taylor Amari Leannon","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"7","taylorName":"Taylor Pearlie Reinger DDS","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"8","taylorName":"Taylor Edgardo Frami","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"9","taylorName":"Taylor Gage Baumbach","districtName":"BANDUNG KULON","taylorRating":"4","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"10","taylorName":"Taylor Leanne Goodwin PhD","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"11","taylorName":"Taylor Eino Bergstrom","districtName":"BANDUNG KULON","taylorRating":"3","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"12","taylorName":"Taylor Name Auer MD","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"13","taylorName":"Taylor Tracy Steuber DDS","districtName":"BANDUNG KULON","taylorRating":"5","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"14","taylorName":"Taylor Johan Hettinger DDS","districtName":"BANDUNG KULON","taylorRating":"0","taylorComtrans":null,"taylorPhoto":"avatar.png"},{"taylorId":"15","taylorName":"Taylor Wilma Connelly","districtName":"BANDUNG KULON","taylorRating":"1","taylorComtrans":null,"taylorPhoto":"avatar.png"}]
/// first_page_url : "https://apijahitkeeun.tepat.co.id/api/taylor?page=1"
/// from : 1
/// last_page : 5
/// last_page_url : "https://apijahitkeeun.tepat.co.id/api/taylor?page=5"
/// next_page_url : "https://apijahitkeeun.tepat.co.id/api/taylor?page=2"
/// path : "https://apijahitkeeun.tepat.co.id/api/taylor"
/// per_page : 15
/// prev_page_url : null
/// to : 15
/// total : 68

class Data {
  Data({
      num? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      num? from, 
      num? lastPage, 
      String? lastPageUrl, 
      String? nextPageUrl, 
      String? path, 
      num? perPage, 
      dynamic prevPageUrl, 
      num? to, 
      num? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  num? _currentPage;
  List<Data2>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  String? _nextPageUrl;
  String? _path;
  num? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
Data copyWith({  num? currentPage,
  List<Data2>? data,
  String? firstPageUrl,
  num? from,
  num? lastPage,
  String? lastPageUrl,
  String? nextPageUrl,
  String? path,
  num? perPage,
  dynamic prevPageUrl,
  num? to,
  num? total,
}) => Data(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  num? get currentPage => _currentPage;
  List<Data2>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  num? get from => _from;
  num? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  num? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  num? get to => _to;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// taylorId : "1"
/// taylorName : "Taylor Jada Bauch"
/// districtName : "BANDUNG KULON"
/// taylorRating : "5"
/// taylorComtrans : null
/// taylorPhoto : "avatar.png"

class Data2 {
  Data2({
      String? taylorId, 
      String? taylorName, 
      String? districtName, 
      String? taylorRating, 
      dynamic taylorComtrans, 
      String? taylorPhoto,}){
    _taylorId = taylorId;
    _taylorName = taylorName;
    _districtName = districtName;
    _taylorRating = taylorRating;
    _taylorComtrans = taylorComtrans;
    _taylorPhoto = taylorPhoto;
}

  Data2.fromJson(dynamic json) {
    _taylorId = json['taylorId'];
    _taylorName = json['taylorName'];
    _districtName = json['districtName'];
    _taylorRating = json['taylorRating'];
    _taylorComtrans = json['taylorComtrans'];
    _taylorPhoto = json['taylorPhoto'];
  }
  String? _taylorId;
  String? _taylorName;
  String? _districtName;
  String? _taylorRating;
  dynamic _taylorComtrans;
  String? _taylorPhoto;
Data2 copyWith({  String? taylorId,
  String? taylorName,
  String? districtName,
  String? taylorRating,
  dynamic taylorComtrans,
  String? taylorPhoto,
}) => Data2(  taylorId: taylorId ?? _taylorId,
  taylorName: taylorName ?? _taylorName,
  districtName: districtName ?? _districtName,
  taylorRating: taylorRating ?? _taylorRating,
  taylorComtrans: taylorComtrans ?? _taylorComtrans,
  taylorPhoto: taylorPhoto ?? _taylorPhoto,
);
  String? get taylorId => _taylorId;
  String? get taylorName => _taylorName;
  String? get districtName => _districtName;
  String? get taylorRating => _taylorRating;
  dynamic get taylorComtrans => _taylorComtrans;
  String? get taylorPhoto => _taylorPhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taylorId'] = _taylorId;
    map['taylorName'] = _taylorName;
    map['districtName'] = _districtName;
    map['taylorRating'] = _taylorRating;
    map['taylorComtrans'] = _taylorComtrans;
    map['taylorPhoto'] = _taylorPhoto;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : "list data taylor"

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