import 'post_response.dart';
export 'post_response.dart';

class PostsResponse {
  List<PostResponse> posts = [];

  PostsResponse.fromJson(List<dynamic> json) {
    for (var item in json) {
      final result = PostResponse.fromJson(item);
      posts.add(result);
    }
  }
}