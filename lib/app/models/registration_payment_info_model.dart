class RegistrationPaymentInformationModel {
  String? result;
  String? paymentStatus;
  RegistrationInformation? registrationInformation;
  int? isPopup;
  List<TermsAndConditions>? termsAndConditions;

  RegistrationPaymentInformationModel({this.result, this.paymentStatus, this.registrationInformation, this.isPopup, this.termsAndConditions});

  RegistrationPaymentInformationModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    paymentStatus = json['payment_status'];
    registrationInformation = json['registration_information'] != null ? RegistrationInformation.fromJson(json['registration_information']) : null;
    isPopup = json['is_popup'];
    if (json['terms_and_conditions'] != null) {
      termsAndConditions = <TermsAndConditions>[];
      json['terms_and_conditions'].forEach((v) {
        termsAndConditions!.add(TermsAndConditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['payment_status'] = paymentStatus;
    if (registrationInformation != null) {
      data['registration_information'] = registrationInformation!.toJson();
    }
    data['is_popup'] = isPopup;
    if (termsAndConditions != null) {
      data['terms_and_conditions'] = termsAndConditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegistrationInformation {
  int? id;
  int? paymentAmount;
  String? message;

  RegistrationInformation({this.id, this.paymentAmount, this.message});

  RegistrationInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentAmount = json['payment_amount'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_amount'] = paymentAmount;
    data['message'] = message;
    return data;
  }
}

class TermsAndConditions {
  String? message;
  int? amount;

  TermsAndConditions({this.message, this.amount});

  TermsAndConditions.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['amount'] = amount;
    return data;
  }
}
