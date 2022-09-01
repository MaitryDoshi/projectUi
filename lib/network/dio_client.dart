import 'package:dio/dio.dart';
import '../model/login_response.dart';
import '../model/office_initialdata.dart';
import 'authentication.dart';
import 'endpoint.dart';
import 'exception.dart';
import '../model/officedependency.dart';
import 'interceptor.dart';

class DioServiceClient{
  late final Dio _dio;
  DioServiceClient()
  : _dio = Dio(
    BaseOptions(
      baseUrl: 'http://3.7.71.53/beml/modules/Mobile/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([AuthorizationInterceptor(), LoggerInterceptor()]);
  //'.. is spread collector which use for add multiple elements into a collection'


  //post method for beml login
  Future<LoginResponse?> loginBemlUser(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post(
        Endpoints.login,
        data: {'username': username, 'password': password},
      );
      return LoginResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<LoginResponse?> createlogin({required String username, required String password}) async{
    try{
      final response = await _dio.post('/v1/login', data: {'username': username, 'password': password},);
      return LoginResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OfficeInitialdata?> initData() async{
    try{
      final response = await _dio.post(Endpoints.initialOffice);
      return OfficeInitialdata.fromJson(response.data);
    }on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Officedependency?> showData() async{
    try{
      final response = await _dio.post(Endpoints.initialOffice);
      return Officedependency.fromJson(response.data);
    }on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OfficeInitialdata?> updateData({required OfficeInitialdata officeInitialdata, required String id}) async{
    OfficeInitialdata? upadteInfo;
    try{
      Response response = await _dio.put(Endpoints.initialOffice, data: officeInitialdata.toJson(),);
      print("Data has been updated: ${response.data}");
      upadteInfo = OfficeInitialdata.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
    return upadteInfo;
  }

  Future<void> deleteData({required String id}) async {
    try{
      await _dio.delete(Endpoints.initialOffice);
      print("Data has been deleted!");
    }on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }
}