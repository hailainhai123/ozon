class DeviceModel {
  String? deviceId;
  String? stationId;
  String? adminID;
  String? name;
  String? description;
  String? location;
  String? threshold1;
  String? threshold2;
  String? threshold3;
  String? status;
  String? time;
  int? soLanVuot;
  String? ozone;

  DeviceModel({
    this.deviceId,
    this.stationId,
    this.adminID,
    this.name,
    this.description,
    this.location,
    this.threshold1,
    this.threshold2,
    this.threshold3,
    this.status,
    this.time,
    this.soLanVuot,
    this.ozone,
  });

  DeviceModel.fromJson(Map<String, dynamic> json)
      : deviceId = json['deviceId'] ?? "",
        stationId = json['stationId'] ?? "",
        adminID = json['adminID'] ?? "",
        name = json['name'] ?? "Thiết bị ozon",
        description = json['description'] ?? "",
        location = json['location'] ?? "Vị trí A",
        threshold1 = json['threshold1'] ?? "5",
        threshold2 = json['threshold2'] ?? "10",
        threshold3 = json['threshold3'] ?? "15",
        status = json['status'] ?? "",
        time = json['time'] ?? "",
        soLanVuot = json['solanvuot'] ?? 5,
        ozone = json['ozone'] ?? "";

  Map<String, dynamic> toJson() => {
    'deviceId': deviceId,
    'stationId': stationId,
    'adminID': adminID,
    'name': name,
    'description': description,
    'location': location,
    'threshold1': threshold1,
    'threshold2': threshold2,
    'threshold3': threshold3,
    'status': status,
    'time': time,
  };
}
