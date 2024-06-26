// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'person_remote_data_source.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

// class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
//   PersonRemoteDataSourceImpl(
//     this._dio, {
//     this.baseUrl,
//   });

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<List<PersonModel>> getAllPersons(int page) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
//     _headers.removeWhere((k, v) => v == null);
//     print(baseUrl);
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<List<dynamic>>(_setStreamType<List<PersonModel>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//       contentType: 'application/json',
//     )
//             .compose(
//               _dio.options,
//               '/character/?page=${page}',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     if (_result.statusCode == 200) {
//       var value = _result.data!
//           .map((dynamic i) => PersonModel.fromJson(i as Map<String, dynamic>))
//           .toList();
//       return value;
//     } else {
//       throw ServerException();
//     }
//   }

//   @override
//   Future<List<PersonModel>> searchPerson(String query) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<List<dynamic>>(_setStreamType<List<PersonModel>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/character/?name=${query}',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     if (_result.statusCode == 200) {
//       var value = _result.data!
//           .map((dynamic i) => PersonModel.fromJson(i as Map<String, dynamic>))
//           .toList();
//       return value;
//     } else {
//       throw ServerException();
//     }
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
