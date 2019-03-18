import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Post {
  int userId;
  String title;
  Color titleColor;
  String subtitle;
  Color subtitleColor;

  Post({
    @required this.userId,
    @required this.title,
    @required this.titleColor,
    @required this.subtitle,
    @required this.subtitleColor
  });
}