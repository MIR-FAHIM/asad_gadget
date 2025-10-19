class AdBannerModel {
  String? advertisementBanner;

  AdBannerModel({this.advertisementBanner});

  AdBannerModel.fromJson(Map<String, dynamic> json) {
    advertisementBanner = json['advertisement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['advertisement'] = this.advertisementBanner;
    return data;
  }
}
