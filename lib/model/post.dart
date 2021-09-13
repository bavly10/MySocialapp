import 'package:flutter/cupertino.dart';

class post {
  final int id, userid;
  final String content, img, time, username, userimage;
  final List myimages;

  post(
      {@required this.userid,
      @required this.id,
      @required this.content,
      this.img,
        this.myimages,
      @required this.time,
      @required this.username,
      @required this.userimage});
}
