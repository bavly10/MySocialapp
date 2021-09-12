import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/model/post.dart';
import 'package:social_app/model/user.dart';

class Social_Cubit extends Cubit<Social_States> {
  Social_Cubit() : super(Social_InitalState());

  static Social_Cubit get(context) => BlocProvider.of(context);

  List<user> users = [
    user(name: "Mina", email: "mina@x.com", id: 1, image: "assets/pl.jpg"),
    user(name: "Magdy", email: "Magdy@y.com", id: 2, image: "assets/ps.jpg"),
    user(name: "Ahmed ali", email: "Ahmed@x.com", id: 3, image: "assets/pp.jpg"),
    user(name: "Mohamed Ibrahim", email: "Mohamed@x.com", id: 4, image: "assets/ps.jpg"),
    user(name: "Mido", email: "Mido@x.com", id: 5, image: "assets/ps.jpg"),
  ];
  List<post> posts = [
    post(userid: 1,username: "Mina",id: 1, userimage: "assets/pl.jpg",time: "just now", content: "New pic For me!", img: "assets/mypic.jpg"),
    post(userid: 2,username: "Magdy",userimage: "assets/ps.jpg",id: 2, time: "12m", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    post(userid:3,username: "Ahmed ali",userimage: "assets/pp.jpg",id: 3, time: "13m", content: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum"),
    post(userid: 5,username: "Mido",userimage: "assets/ps.jpg",id: 4, time: "26m", content: "Just why i'm Alone? ",img :"assets/loleny.jpg"),
    post(userid: 4,username: "Mohamed Ibrahim",userimage: "assets/ps.jpg",id: 5, time: "1h", content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable"),
  ];
  List<int> num_like=[];
  bool like=false;
  void Change_Like(int i){
    like =!like;
    if(like ==true)
      {
        num_like[i]++;
        emit(Social_Post_plusState());
      }else{
      num_like[i]--;
      emit(Social_Post_minusState());
    }
    print(like);
    emit(Social_Post_likeState());
  }
}
