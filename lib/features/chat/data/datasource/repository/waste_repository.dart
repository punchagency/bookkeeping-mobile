// import 'package:dartz/dartz.dart';
// import 'package:ipos_walure/core/networkhandler/failure.dart';
// import 'package:ipos_walure/features/vendor/data/domain/entity/vendor_list_model.dart';
// import 'package:ipos_walure/features/waste/data/datasource/waste_remote_datasource.dart';
// import 'package:ipos_walure/features/waste/data/domain/entity/add_waste_request_model.dart';
// import 'package:ipos_walure/features/waste/data/domain/repository/waste_repo.dart';

// class WasteRepositoryImpl implements WasteRepository {
//   WasteRepositoryImpl({
//     required this.remoteDatasource,
//   });

//   final IWasteRemoteDatasource remoteDatasource;

//   @override
//   Future<Either<Failure, dynamic>> getWasteList() async {
//     try {
//       var response = await remoteDatasource.getWasteList();

//       return Right(VendorResponse.fromJson(response.data!));
//     } catch (e) {
//       print(e);
//       return Left(
//         Failure(
//           message: ExceptionHandler.handleError(e),
//           data: ExceptionHandler.errorResponseData(e),
//         ),
//       );
//     }
//   }

//   @override
//   Future<Either<Failure, dynamic>> addToWaste(
//       AddWasteRequestModel request) async {
//     try {
//       var response = await remoteDatasource.addToWaste(request);
//       return Right(response);
//     } catch (e) {
//       return Left(
//         Failure(
//           message: ExceptionHandler.handleError(e),
//           data: ExceptionHandler.errorResponseData(e),
//         ),
//       );
//     }
//   }
// }
