import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UtilsLoadingWidget extends StatelessWidget {
  final Color color;

  UtilsLoadingWidget({
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(color)),
    );
  }
}

class UtilsErrorWidget extends StatelessWidget {
  final String text;

  const UtilsErrorWidget({
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1))),
    );
  }
}