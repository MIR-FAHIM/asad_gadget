// To parse this JSON data, do
//
//     final bookTicketModel = bookTicketModelFromJson(jsonString);

import 'dart:convert';

BookTicketModel bookTicketModelFromJson(String str) => BookTicketModel.fromJson(json.decode(str));

String bookTicketModelToJson(BookTicketModel data) => json.encode(data.toJson());

class BookTicketModel {
  String message;
  dynamic errors;
  Data data;
  String version;
  int timestamp;

  BookTicketModel({
    required this.message,
    this.errors,
    required this.data,
    required this.version,
    required this.timestamp,
  });

  factory BookTicketModel.fromJson(Map<String, dynamic> json) => BookTicketModel(
    message: json["message"],
    errors: json["errors"],
    data: Data.fromJson(json["data"]),
    version: json["version"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors,
    "data": data.toJson(),
    "version": version,
    "timestamp": timestamp,
  };
}

class Data {
  String reservationRef;
  String originCity;
  String destinationCity;
  String companyName;
  String tripNumber;
  DateTime journeyDate;
  DateTime reportingTime;
  String boardingPointName;
  String contactName;
  String contactNumber;
  int orderValue;
  String seatNumbers;
  DateTime reserveValidTill;

  Data({
    required this.reservationRef,
    required this.originCity,
    required this.destinationCity,
    required this.companyName,
    required this.tripNumber,
    required this.journeyDate,
    required this.reportingTime,
    required this.boardingPointName,
    required this.contactName,
    required this.contactNumber,
    required this.orderValue,
    required this.seatNumbers,
    required this.reserveValidTill,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    reservationRef: json["reservation_ref"],
    originCity: json["origin_city"],
    destinationCity: json["destination_city"],
    companyName: json["company_name"],
    tripNumber: json["trip_number"],
    journeyDate: DateTime.parse(json["journey_date"]),
    reportingTime: DateTime.parse(json["reporting_time"]),
    boardingPointName: json["boarding_point_name"],
    contactName: json["contact_name"],
    contactNumber: json["contact_number"],
    orderValue: json["order_value"],
    seatNumbers: json["seat_numbers"],
    reserveValidTill: DateTime.parse(json["reserve_valid_till"]),
  );

  Map<String, dynamic> toJson() => {
    "reservation_ref": reservationRef,
    "origin_city": originCity,
    "destination_city": destinationCity,
    "company_name": companyName,
    "trip_number": tripNumber,
    "journey_date": journeyDate.toIso8601String(),
    "reporting_time": reportingTime.toIso8601String(),
    "boarding_point_name": boardingPointName,
    "contact_name": contactName,
    "contact_number": contactNumber,
    "order_value": orderValue,
    "seat_numbers": seatNumbers,
    "reserve_valid_till": reserveValidTill.toIso8601String(),
  };
}
