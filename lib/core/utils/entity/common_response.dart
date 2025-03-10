class CommonResponse {
  String? responseCode;
  String? responseMessage;
  bool? isSuccessful;
  dynamic data;

  CommonResponse(
      {this.responseCode, this.responseMessage, this.isSuccessful, this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    isSuccessful = json['isSuccessful'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    data['isSuccessful'] = isSuccessful;
    data['data'] = this.data;
    return data;
  }
}
