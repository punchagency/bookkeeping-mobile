// import 'package:dio/dio.dart';
// import 'package:ipos_walure/core/networkhandler/network_requester.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:ipos_walure/core/utils/string.dart';
// import 'package:ipos_walure/features/waste/data/domain/entity/add_waste_request_model.dart';

// abstract class IWasteRemoteDatasource {
//   // Future<Response<Map<String, dynamic>>> getWasteList();

//   // Future<Response<Map<String, dynamic>>> addToWaste(
//   //     AddWasteRequestModel request);
// }

// class WasteRemoteDatasourceImpl extends IWasteRemoteDatasource {
//   WasteRemoteDatasourceImpl({
//     required this.networkRequester,
//   });

//   final NetworkRequester networkRequester;

//   final baseUrl = dotenv.env['baseUrl'];

//   @override
//   Future<Response<Map<String, dynamic>>> getWasteList() async {
//     var response = await networkRequester.get(
//       '/mobile/waste/spoil/search-spoil/1/100',
//       isProtected: true,
//       path: baseUrl,
//       contentType: 'application/json',
//       // data: data,
//     );

//     Logger("api request $response");
//     return response;
//   }

//   @override
//   Future<Response<Map<String, dynamic>>> addToWaste(
//       AddWasteRequestModel request) async {
//     var response = await networkRequester.post(
//       '/mobile/waste/addspoil',
//       isProtected: true,
//       path: baseUrl,
//       data: request.toJson(),
//     );

//     Logger("api request $response");
//     return response;
//   }
// }
