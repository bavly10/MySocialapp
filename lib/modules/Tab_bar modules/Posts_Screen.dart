import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/layout/layout.dart';

class Posts_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_Cubit,Social_States>(
      listener: (context,state){},
      builder: (context,state){
        return  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Column(
             children: [
               newPost(context),
               mysmallDivider(),
               stories(context),
               mysmallDivider(),
               post(context),
             ],
            ),
        );
      },
    );
  }
}
