import 'package:rxdart/rxdart.dart';
import '../../data/repository/list_post_repository.dart';
import '../../model/posts.dart';

class HomepageBloc {
  final _repo = ListPostRepository();
  Posts _posts;
  final _currentPosts = PublishSubject<Posts>();

  Observable<Posts> get currentPosts => _currentPosts.stream;

  void request() async {
    final result = await _repo.request();
    if (result != null) {
      _posts = result;
      _updateStream();
    } else {
      _updateErrorStream("null");
    }
  }

  void _updateStream() {
    _currentPosts.sink.add(_posts);
  }

  void _updateErrorStream(String error) {
    _currentPosts.sink.addError(error);
  }

  dispose() {
    _currentPosts.close();
  }
}