import 'dart:math';

import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/model/post.dart';
import 'package:social_app/model/user.dart';
import 'package:social_app/shared/MyColors.dart';
import 'package:social_app/shared/network/iconShare.dart';
import 'package:social_app/shared/styles.dart';

Widget Small_icons(IconData icon) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: (Icon(icon,color: mygrey,size: 20.0,)
    ),
  );
}

Widget buildStroy(user e) {
  return Container(
    width: 115,
    height: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: ExactAssetImage(e.image),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.3,
                  ),
                  image: DecorationImage(
                      image: ExactAssetImage(e.image),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('${e.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget buildpost({post p, BuildContext context,bool color_like,i}){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5,right: 12, left: 4),
              child: CircleAvatar(
                backgroundImage: AssetImage("${p.userimage}",),
                radius: 28,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${p.username}", style: styleText(fontWeight: FontWeight.bold),),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Text("${p.time}", style: TextStyle(color: Colors.grey),),
                   const SizedBox(width: 5,),
                    Icon( MdiIcons.earth,size: 14,color: Colors.grey[700],)
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.more_horiz_outlined),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.centerLeft,child: Text("${p.content}",style: styleText(fontsize: 16),)),
      ),
      p.img==null?Text(""):Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child:OpenContainer(
          openBuilder: (BuildContext context, void Function({Object returnValue}) action) {
            return Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 500,
                          width: double.infinity,
                          image: ExactAssetImage(p.img,),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${p.content}',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Social_Cubit.get(context).Change_Like(i);
                        },
                        icon: Icon(
                          MdiIcons.thumbUpOutline,
                          color: Social_Cubit.get(context).like ? Colors.blueAccent : mybloodgrey,
                        ),
                        label: Text(
                          "Like",
                          style: TextStyle(color:Colors.white),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon( MdiIcons.commentOutline,color: mybloodgrey,),
                        label: Text("Comment",
                          style: TextStyle(color:Colors.white),),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.share,
                          color: mybloodgrey,
                        ),
                        label: Text(
                            "Share",
                            style: TextStyle(color:Colors.white)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          closedBuilder: (BuildContext context, void Function() action) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: Image(
                image: ExactAssetImage(
                  '${p.img}',
                ),
              ),
            );
          },
        ),
      ),
      p.myimages==null?Text(""):CarouselSlider(
          carouselController: CarouselControllerImpl(),
          items: p.myimages.map((e) => Image(image: ExactAssetImage(e.toString()),fit:BoxFit.fitWidth)).toList(),
          options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 2),
              enlargeCenterPage: true,
              initialPage: 0,
              autoPlay: true,
              scrollDirection: Axis.horizontal)),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: [
            Icon( MdiIcons.thumbUp,size: 15,),
            SizedBox(width: 5,),
            Text("${Social_Cubit.get(context).num_like.elementAt(i)}"),
          ],),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        color: Colors.black,
        height: 1,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Social_Cubit.get(context).Change_Like(i);
              },
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Social_Cubit.get(context).like ? Colors.blueAccent : mybloodgrey,
              ),
              label: Text(
                "Like",
                style: TextStyle(color:Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon( MdiIcons.commentOutline,color: mybloodgrey,),
              label: Text("Comment", style: TextStyle(color:Colors.black87),),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                MdiIcons.share,
                color: mybloodgrey,
              ),
              label: Text(
                "Share",
                style: TextStyle(color:Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0)),
            ),
          ],
        ),
      ),
    ],
  );
}
