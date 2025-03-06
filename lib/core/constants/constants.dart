//! Map keys
import 'dart:io';

const String kPHONE = 'phoneNumber';
const String kUSERNAME = 'username';
const String kAPPVERSION = 'appVersion';
const String kLOGINTYPE = 'loginType';
const String kPASSWORD = 'password';
const String kPAYLOAD = 'payload';

class Constant {
  static get channel => "mobile";

  static get minimumLoanAmount => 5000;
  static get maxFileSize => 5000000; //equivalent to  5MB
  static get minimumLoanAmount2 => 50000;

  static get ONBOARDING => "onboarding";
  static get SIGNIN => "signIn";

  /////////////////////////////////////////////////
  /////////////////////////////////////////////////
  /////SHARED PREFERENCE ///////////////////////////
  static get userName => "username";
  static get newCustomerChoice => "newCustomerChoice";
  static get bvn => "bvn";

  static get kAppVersionNumber => Platform.isAndroid ? "1.5" : "1.5";
  static get kAppPlatformName => Platform.isAndroid == true ? "android" : "ios";

  static get userId => "userId";
  static get userEmail => "userEmail";
  static get timeOfLogin => "LoginTime";
  static get timeOfLogOut => "LogOutTime";
  static get REQUEST_TITLE => "requestTitle";

//password
  static get secureStorageParam => "param";

  static get isFingerPrintEnabled => "isFingerPrintEnabled";

  static get isFingerPrintDialogShow => "isFingerPrintDialogShow";
  static get showWiseDialog => "showWise";
  static get showOnce => "showOnce";
  static get dontShowAgain => "dontShowAgain";

  static get refreshToken => "refresh_token";
  static get expireIn => "expire_in";
  static get tokenType => "token_type";
  static get accessTokenPart1 => "partone";
  static get accessTokenPart2 => "parttwo";
  static get accessTokenPart3 => "partthree";
  static get accessTokenExpiresIn => "access_token_expires";
  static get accessTokenGrantType => "access_token_grant_type";

  static get profilePicture => "profile_picture";
  static get PROFILE => "profile";

  static get PROFILE_STATUS => "profileStatus";
  static get CONTACT_US_REQUEST_TYPE => "contact_us_request_type";
  static get STUDENT_DETAIL => "studentDetail";

  static get keyReferralCode => "referral_code";

  static get keyReferrspaceAppAndC => "referral_TAndC";

  static get keyReferralAmount => "referral_amount";

  static get keyCurrencyList => "currency_list";
  static get loggedInFirstTime => "logged_In_FirstTime";

  static get nairaSign => "₦";

  static get ngnSign => "NGN";
  static get dollar => "\$";
  static get euro => "€";
  static get pounds => "£";

  static get TWO_FACTOR => "2FA";

  static get CHANNEL_CHALLENGES => "channelChallenges";

  static get defaultLimit => 5000.0;

  static get allowedExtensions => ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'];

  /////////////DATABASE/////////////////
  //////////////////////////////////////

  static get CURRENCY => "Currency";

  static get EVENTS => "student";
  static get COURSES => "courses";

  static get BANNER_TABLE => "banner";

  static get CHALLENGE_TABLLE => "challenge";

  static get REQUEST_TYPE => "requestType";

  static get API_CALL_TYPE => "apiCalls";

  static get pageSize => 1000000;
  static get page => 1;

  /////////////////////////////////////////////////////////////////////////////////
//////////////////////////Token //////////////////////////
/////////////////////////////////////////////////////////////////////////////////

  static get REFRESHTOKEN => "refreshToken";
  static get REFRESHTOKENTYPE => "refreshTokenType";
  static get REFRESHTOKENTMODELEXP => "refreshTokenModelExp";
  static get ACCESSTOKENTMODEL1 => "accessTokenModel1";
  static get ACCESSTOKENTMODEL2 => "accessTokenModel2";
  static get ACCESSTOKENTMODEL3 => "accessTokenModel3";

  static get TermAndConditionsOpening => "https://api.spaceApp.ng/privacy/";
}
