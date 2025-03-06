class AccessTokenProperty {
  var studentId;
  var sub;
  var authTime;
  var idp;
  var profileId;
  var email;
  var firstName;
  var lastName;
  var phoneNumber;
  var userType;
  var organizationId;
  var corporate;
  var permission;

  AccessTokenProperty();

  factory AccessTokenProperty.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenPropertyToJson(this);
}

AccessTokenProperty _$AccessTokenPropertyFromJson(Map<String, dynamic> json) {
  return AccessTokenProperty()
    ..studentId = json['student_Id']
    ..sub = json['sub']
    ..authTime = json['auth_time']
    ..idp = json['idp']
    ..profileId = json['id']
    ..email = json['email']
    ..firstName = json['given_name']
    ..lastName = json['family_name']
    ..phoneNumber = json['phone_number']
    ..userType = json['UserType']
    ..organizationId = json['OrganizationId']
    ..corporate = json['Corporate']
    ..permission = json['Permission'];
}

Map<String, dynamic> _$AccessTokenPropertyToJson(
        AccessTokenProperty instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'sub': instance.sub,
      'auth_time': instance.authTime,
      'idp': instance.idp,
      'id': instance.profileId,
      'email': instance.email,
      'given_name': instance.firstName,
      'family_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'UserType': instance.userType,
      'OrganizationId': instance.organizationId,
      'Corporate': instance.corporate,
      'Permission': instance.permission,
    };
