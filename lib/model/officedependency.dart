/// statuscode : 1
/// data : {"cust_role":[{"c_role":"Service Manager"},{"c_role":"Service Engineer"}],"service_centre":[{"service":"Ahmedabad"}],"district_office":[{"dist_office":"Chennai"}],"regional_office":[{"region_office":"Surat"}],"production_division":[{"production_div":"Ahmedabad"}],"activity_centre":[{"activity":"NVS"}]}
/// statusMessage : "Successfully Fetched Data"

class Officedependency {
  Officedependency({
      num? statuscode, 
      Data? data, 
      String? statusMessage,}){
    _statuscode = statuscode;
    _data = data;
    _statusMessage = statusMessage;
}

  Officedependency.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _statusMessage = json['statusMessage'];
  }
  num? _statuscode;
  Data? _data;
  String? _statusMessage;
Officedependency copyWith({  num? statuscode,
  Data? data,
  String? statusMessage,
}) => Officedependency(  statuscode: statuscode ?? _statuscode,
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

/// cust_role : [{"c_role":"Service Manager"},{"c_role":"Service Engineer"}]
/// service_centre : [{"service":"Ahmedabad"}]
/// district_office : [{"dist_office":"Chennai"}]
/// regional_office : [{"region_office":"Surat"}]
/// production_division : [{"production_div":"Ahmedabad"}]
/// activity_centre : [{"activity":"NVS"}]

class Data {
  Data({
      List<CustRole>? custRole, 
      List<ServiceCentre>? serviceCentre, 
      List<DistrictOffice>? districtOffice, 
      List<RegionalOffice>? regionalOffice, 
      List<ProductionDivision>? productionDivision, 
      List<ActivityCentre>? activityCentre,}){
    _custRole = custRole;
    _serviceCentre = serviceCentre;
    _districtOffice = districtOffice;
    _regionalOffice = regionalOffice;
    _productionDivision = productionDivision;
    _activityCentre = activityCentre;
}

  Data.fromJson(dynamic json) {
    if (json['cust_role'] != null) {
      _custRole = [];
      json['cust_role'].forEach((v) {
        _custRole?.add(CustRole.fromJson(v));
      });
    }
    if (json['service_centre'] != null) {
      _serviceCentre = [];
      json['service_centre'].forEach((v) {
        _serviceCentre?.add(ServiceCentre.fromJson(v));
      });
    }
    if (json['district_office'] != null) {
      _districtOffice = [];
      json['district_office'].forEach((v) {
        _districtOffice?.add(DistrictOffice.fromJson(v));
      });
    }
    if (json['regional_office'] != null) {
      _regionalOffice = [];
      json['regional_office'].forEach((v) {
        _regionalOffice?.add(RegionalOffice.fromJson(v));
      });
    }
    if (json['production_division'] != null) {
      _productionDivision = [];
      json['production_division'].forEach((v) {
        _productionDivision?.add(ProductionDivision.fromJson(v));
      });
    }
    if (json['activity_centre'] != null) {
      _activityCentre = [];
      json['activity_centre'].forEach((v) {
        _activityCentre?.add(ActivityCentre.fromJson(v));
      });
    }
  }
  List<CustRole>? _custRole;
  List<ServiceCentre>? _serviceCentre;
  List<DistrictOffice>? _districtOffice;
  List<RegionalOffice>? _regionalOffice;
  List<ProductionDivision>? _productionDivision;
  List<ActivityCentre>? _activityCentre;
Data copyWith({  List<CustRole>? custRole,
  List<ServiceCentre>? serviceCentre,
  List<DistrictOffice>? districtOffice,
  List<RegionalOffice>? regionalOffice,
  List<ProductionDivision>? productionDivision,
  List<ActivityCentre>? activityCentre,
}) => Data(  custRole: custRole ?? _custRole,
  serviceCentre: serviceCentre ?? _serviceCentre,
  districtOffice: districtOffice ?? _districtOffice,
  regionalOffice: regionalOffice ?? _regionalOffice,
  productionDivision: productionDivision ?? _productionDivision,
  activityCentre: activityCentre ?? _activityCentre,
);
  List<CustRole>? get custRole => _custRole;
  List<ServiceCentre>? get serviceCentre => _serviceCentre;
  List<DistrictOffice>? get districtOffice => _districtOffice;
  List<RegionalOffice>? get regionalOffice => _regionalOffice;
  List<ProductionDivision>? get productionDivision => _productionDivision;
  List<ActivityCentre>? get activityCentre => _activityCentre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_custRole != null) {
      map['cust_role'] = _custRole?.map((v) => v.toJson()).toList();
    }
    if (_serviceCentre != null) {
      map['service_centre'] = _serviceCentre?.map((v) => v.toJson()).toList();
    }
    if (_districtOffice != null) {
      map['district_office'] = _districtOffice?.map((v) => v.toJson()).toList();
    }
    if (_regionalOffice != null) {
      map['regional_office'] = _regionalOffice?.map((v) => v.toJson()).toList();
    }
    if (_productionDivision != null) {
      map['production_division'] = _productionDivision?.map((v) => v.toJson()).toList();
    }
    if (_activityCentre != null) {
      map['activity_centre'] = _activityCentre?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// activity : "NVS"

class ActivityCentre {
  ActivityCentre({
      String? activity,}){
    _activity = activity;
}

  ActivityCentre.fromJson(dynamic json) {
    _activity = json['activity'];
  }
  String? _activity;
ActivityCentre copyWith({  String? activity,
}) => ActivityCentre(  activity: activity ?? _activity,
);
  String? get activity => _activity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = _activity;
    return map;
  }

}

/// production_div : "Ahmedabad"

class ProductionDivision {
  ProductionDivision({
      String? productionDiv,}){
    _productionDiv = productionDiv;
}

  ProductionDivision.fromJson(dynamic json) {
    _productionDiv = json['production_div'];
  }
  String? _productionDiv;
ProductionDivision copyWith({  String? productionDiv,
}) => ProductionDivision(  productionDiv: productionDiv ?? _productionDiv,
);
  String? get productionDiv => _productionDiv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['production_div'] = _productionDiv;
    return map;
  }

}

/// region_office : "Surat"

class RegionalOffice {
  RegionalOffice({
      String? regionOffice,}){
    _regionOffice = regionOffice;
}

  RegionalOffice.fromJson(dynamic json) {
    _regionOffice = json['region_office'];
  }
  String? _regionOffice;
RegionalOffice copyWith({  String? regionOffice,
}) => RegionalOffice(  regionOffice: regionOffice ?? _regionOffice,
);
  String? get regionOffice => _regionOffice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['region_office'] = _regionOffice;
    return map;
  }

}

/// dist_office : "Chennai"

class DistrictOffice {
  DistrictOffice({
      String? distOffice,}){
    _distOffice = distOffice;
}

  DistrictOffice.fromJson(dynamic json) {
    _distOffice = json['dist_office'];
  }
  String? _distOffice;
DistrictOffice copyWith({  String? distOffice,
}) => DistrictOffice(  distOffice: distOffice ?? _distOffice,
);
  String? get distOffice => _distOffice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dist_office'] = _distOffice;
    return map;
  }

}

/// service : "Ahmedabad"

class ServiceCentre {
  ServiceCentre({
      String? service,}){
    _service = service;
}

  ServiceCentre.fromJson(dynamic json) {
    _service = json['service'];
  }
  String? _service;
ServiceCentre copyWith({  String? service,
}) => ServiceCentre(  service: service ?? _service,
);
  String? get service => _service;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['service'] = _service;
    return map;
  }

}

/// c_role : "Service Manager"

class CustRole {
  CustRole({
      String? cRole,}){
    _cRole = cRole;
}

  CustRole.fromJson(dynamic json) {
    _cRole = json['c_role'];
  }
  String? _cRole;
CustRole copyWith({  String? cRole,
}) => CustRole(  cRole: cRole ?? _cRole,
);
  String? get cRole => _cRole;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['c_role'] = _cRole;
    return map;
  }

}