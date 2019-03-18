import 'package:meta/meta.dart';
import 'http_method.dart';
export 'http_method.dart';

class HTTPRequest {
  final String version;
  final String path;
  final HTTPMethod method;
  
  const HTTPRequest({
    @required this.version, 
    @required this.path,
    @required this.method
  })  : assert(version != null),
        assert(path != null),
        assert(method != null);
}