
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'baseURL.dart';

class DioClient {
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,


        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
    );


    _dio.options.baseUrl = BaseURL.Baseurl;

    return _dio;
  }
}