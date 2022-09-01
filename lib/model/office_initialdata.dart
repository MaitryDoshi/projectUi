/// statuscode : 1
/// data : {"office":[{"office":"Corporate Office-BEML Soudha"},{"office":"Marketing Headquarter-Unity Buildings"},{"office":"Regional Office"},{"office":"District Office"},{"office":"Activity Centre"},{"office":"Service Centre"},{"office":"Production Division"},{"office":"International Business Division-New Delhi"}]}
/// statusMessage : "Successfully Fetched Data"

class OfficeInitialdata {
  OfficeInitialdata({
      num? statuscode, 
      Data? data, 
      String? statusMessage,}){
    _statuscode = statuscode;
    _data = data;
    _statusMessage = statusMessage;
}

  OfficeInitialdata.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _statusMessage = json['statusMessage'];
  }
  num? _statuscode;
  Data? _data;
  String? _statusMessage;
OfficeInitialdata copyWith({  num? statuscode,
  Data? data,
  String? statusMessage,
}) => OfficeInitialdata(  statuscode: statuscode ?? _statuscode,
  data: data ?? _data,
  statusMessage: statusMessage ?? _statusMessage,
);
  num? get statuscode => _statuscode;
  Data? get data => _data;
  String? get statusMessage => _statusMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['statusMessage'] = _statusMessage;
    return map;
  }

}

/// office : [{"office":"Corporate Office-BEML Soudha"},{"office":"Marketing Headquarter-Unity Buildings"},{"office":"Regional Office"},{"office":"District Office"},{"office":"Activity Centre"},{"office":"Service Centre"},{"office":"Production Division"},{"office":"International Business Division-New Delhi"}]

class Data {
  Data({
      List<Office>? office,}){
    _office = office;
}

  Data.fromJson(dynamic json) {
    if (json['office'] != null) {
      _office = [];
      json['office'].forEach((v) {
        _office?.add(Office.fromJson(v));
      });
    }
  }
  List<Office>? _office;
Data copyWith({  List<Office>? office,
}) => Data(  office: office ?? _office,
);
  List<Office>? get office => _office;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_office != null) {
      map['office'] = _office?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// office : "Corporate Office-BEML Soudha"

class Office {
  Office({
      String? office,}){
    _office = office;
}

  Office.fromJson(dynamic json) {
    _office = json['office'];
  }
  String? _office;
Office copyWith({  String? office,
}) => Office(  office: office ?? _office,
);
  String? get office => _office;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['office'] = _office;
    return map;
  }

}