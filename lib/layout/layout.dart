import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/model/user.dart';
import 'package:social_app/shared/MyColors.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/shared/styles.dart';
import 'package:stack_percentage/stack_percentage.dart';

Widget iconNotification()=> Stack(
  children:[
    Icon(
   MdiIcons.bellOutline,
    color: myBlack_icon_TabBar,
    size: 35,
    ),
    Container(
      height: 18,width: 18,
      decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(25.0)),
      child: Center(child: Text("3"),),
    ),
  ],
);

Widget newPost(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: ExactAssetImage("assets/pp.jpg"),
            ),
            SizedBox(width: 10,),
            Container(
              height: 40,
              width:MediaQuery.of(context).size.width*0.70,
              decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(55.0)),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'What\'s on your mind?',
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        const Divider(
          color: Colors.black,
          height: 1,
        ),
        Container(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                label: Text('Live', style: styleText(color: Colors.black)),
              ),
              const VerticalDivider(
                width: 8.0,
                color: Colors.black,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label: Text('Photo', style: styleText(color: Colors.black)),
              ),
              const VerticalDivider(
                width: 8.0,
                color: Colors.black,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call,
                  color: Colors.deepPurple,
                ),
                label: Text(
                  'Room',
                  style: styleText(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget mysmallDivider() => Container(
      height: 10,
      color: Colors.grey[400],
    );

Widget stories(context) {
  final list = Social_Cubit.get(context).users;
  return Container(
    height: 250,
    color: Colors.white,
    width: double.infinity,
    padding: EdgeInsetsDirectional.only(
      end: 15,
      top: 10,
      bottom: 10,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          widget(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) => buildStroy(list[index]),
            itemCount: list.length,
          ),
        ],
      ),
    ),
  );
}
Widget widget() => Container(
  width: 115,
  height: double.infinity,
  child: Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/pp.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Create Story',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      PositionedDirectional(
        top: Percent.widgetVerticalPosition(
          ratio: 60,
          heightChild: 50,
          heightParent: 270,
        ),
        start: Percent.widgetHorizontalPosition(
          ratio: 50,
          widthChild: 40,
          widthParent: 115,
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            border: Border.all(
              color: Colors.white,
              width: 2.3,
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    ],
  ),
);
Widget post(context) {
  final listpost = Social_Cubit.get(context).posts;
  final cubit = Social_Cubit.get(context);
 bool color_like = false;
  return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        if(cubit.num_like.length < listpost.length)
          {
            cubit.num_like.add(0);
          }
        return buildpost(context: ctx, p: listpost[index], color_like: color_like,i: index);
      },
      separatorBuilder: (ctx, index) =>mysmallDivider(),
      itemCount: listpost.length);
}
