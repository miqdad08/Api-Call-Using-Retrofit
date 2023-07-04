import 'package:api_call_using_retrofit/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('posts')
  Future<List<PostModel>> getPost();
}
