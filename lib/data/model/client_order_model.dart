
class ClientOrderModel {
  Meta? meta;
  Data? data;

  ClientOrderModel({this.meta, this.data});

  ClientOrderModel.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<Data1>? data;
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

  Data({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
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

class Data1 {
  String? id;
  String? invoice;
  String? tglOrder;
  String? namapembeli;
  String? alamat;
  String? jasa;
  String? quantity;
  String? price;
  String? orderStatus;
  String? paymentStatus;
  String? pickup;
  String? namapenjahit;
  String? photoClient1;
  String? photoTaylor1;

  Data1({this.id, this.invoice, this.tglOrder, this.namapembeli, this.alamat, this.jasa, this.quantity, this.price, this.orderStatus, this.paymentStatus, this.pickup, this.namapenjahit, this.photoClient1, this.photoTaylor1});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    invoice = json["invoice"];
    tglOrder = json["tgl_order"];
    namapembeli = json["namapembeli"];
    alamat = json["alamat"];
    jasa = json["jasa"];
    quantity = json["quantity"];
    price = json["price"];
    orderStatus = json["orderStatus"];
    paymentStatus = json["paymentStatus"];
    pickup = json["pickup"];
    namapenjahit = json["namapenjahit"];
    photoClient1 = json["photoClient1"];
    photoTaylor1 = json["photoTaylor1"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["invoice"] = invoice;
    _data["tgl_order"] = tglOrder;
    _data["namapembeli"] = namapembeli;
    _data["alamat"] = alamat;
    _data["jasa"] = jasa;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["orderStatus"] = orderStatus;
    _data["paymentStatus"] = paymentStatus;
    _data["pickup"] = pickup;
    _data["namapenjahit"] = namapenjahit;
    _data["photoClient1"] = photoClient1;
    _data["photoTaylor1"] = photoTaylor1;
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