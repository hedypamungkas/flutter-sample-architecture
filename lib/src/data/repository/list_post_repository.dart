import 'package:flutter/material.dart' show Color, Colors;
import '../api/get_posts_api.dart';
import '../../model/posts.dart';
import '../response/posts_response.dart';

class ListPostRepository {
  GetPostsAPI _api = GetPostsAPI();

  Future<Posts> request() async {
    final request = await _api.request();
    if (request == null) {
      return null;
    }
    final result = _transform(request);
    return result;
  }

  Posts _transform(PostsResponse response) {
    Posts posts = Posts(
      posts: _postTransform(response.posts)
    );
    return posts;
  }

  List<Post> _postTransform(List<PostResponse> responses) {
    List<Post> posts = [];

    for (var response in responses) {
      Post post = Post(
        userId: response.userId,
        title: response.title,
        titleColor: _titleColorTransform(response.id),
        subtitle: response.body,
        subtitleColor: _subtitleColorTransform(response.id)
      );
      posts.add(post);
    }
    
    return posts;
  }

  Color _titleColorTransform(int id) {
    if (_isEven(id)) {
      return Colors.red;
    }
    return Colors.lightBlue;
  }

  Color _subtitleColorTransform(int id) {
    if (_isEven(id)) {
      return Colors.redAccent;
    }
    return Colors.lightBlueAccent;
  }

  bool _isEven(int id) {
    if (id % 2 == 0) {
      return true;
    }
    return false;
  }
}