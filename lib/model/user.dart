import 'package:flutter/cupertino.dart';

class user{
  final String name,email,image;
  final int id;
  user({
   @required this.name,
    @required this.email,
    this.image,
    @required this.id,
  });
}