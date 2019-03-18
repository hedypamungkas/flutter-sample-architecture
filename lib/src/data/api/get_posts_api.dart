import '../../helpers/http/http_client.dart';
import '../response/posts_response.dart';

class GetPostsAPI {
  HTTPClient _client = HTTPClient();
  HTTPRequest _request = HTTPRequest(
    version: "v1",
    path: "/posts",
    method: HTTPMethod.GET
  );

  Future<PostsResponse> request([dynamic parameters]) async {
    final response = await _client.send(_request, parameters: parameters);
    if (response == null) {
      return null;
    }
    return PostsResponse.fromJson(response);
  }
}