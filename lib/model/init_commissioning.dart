final String tableInitCommissioningData = 'InitCommissionData';

class InitCommissioningFields {
  static final String model = 'model';
  static final String HourMeterReading = 'HourMeterReading';
  static final String equSlNumber = 'equSlNumber';
  static final String kmReading = 'kmReading';
  static final String equstatus = 'equstatus';
  static final String dod = 'dod';
  static final String sysAffect = 'sysAffect';
  static final String remarks = 'remarks';
  //static final String images = 'images';
  static final String address = 'address';
  static final String pincode = 'pincode';
  static final String city = 'city';
  static final String state = 'state';
  static final String nearbyStation = 'nearbyStation';
  static final String name = 'name';
  static final String phone = 'phone';
}

class InitCommissioning {
  late final String model;
  late final String equnumber;
  late final String hours;
  late final String kmreading;
  late final String equstatus;
  late final String dod;
  late final String sysAffect;
  late final String remarks;
  //late final String images;
  late final String address;
  late final String pincode;
  late final String city;
  late final String state;
  late final String nearbyStation;
  late final String name;
  late final String phone;

  InitCommissioning(
    this.model,
    this.hours,
    this.equnumber,
    this.kmreading,
    this.equstatus,
    this.dod,
    this.sysAffect,
    this.remarks,
    //this.images,
    this.address,
    this.pincode,
    this.city,
    this.state,
    this.nearbyStation,
    this.name,
    this.phone,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'model': model,
      'kmreading': kmreading,
      'hours': hours,
      'equnumber': equnumber,
      'equstatus': equstatus,
      'dod': dod,
      'sysAffect' : sysAffect,
      'remarks' : remarks,
      //'images' : images,
      'address' : address,
      'pincode' : pincode,
      'city' : city,
      'state' : state,
      'nearbyStation': nearbyStation,
      'name' : name,
      'phone' : phone,
    };
    return map;
  }

  //create data from map function
  InitCommissioning.fromMap(Map<String, dynamic> map){
    model = map['model'];
    kmreading = map['kmreading'];
    hours = map['hours'];
    equnumber = map['equnumber'];
    equstatus = map['equstatus'];
    dod = map['dod'];
    sysAffect = map['sysAffect'];
    remarks = map['remarks'];
    //images = map['images'];
    address = map['address'];
    pincode = map['pincode'];
    city = map['city'];
    state = map['state'];
    nearbyStation = map['nearbyStation'];
    name = map['name'];
    phone = map['phone'];
  }
}