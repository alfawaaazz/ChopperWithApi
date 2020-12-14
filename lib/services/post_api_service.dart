import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: "https://api.mocki.io/v1/ef57b4f4")
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getItems();

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$PostApiService(client);
  }
}
