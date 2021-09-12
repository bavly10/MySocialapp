import 'package:flutter/cupertino.dart';

class post {
  final int id, userid;
  final String content, img, time, username, userimage;

  post(
      {@required this.userid,
      @required this.id,
      @required this.content,
      this.img,
      @required this.time,
      @required this.username,
      @required this.userimage});
}
