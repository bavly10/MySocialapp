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
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height:220,
              width:130,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: ExactAssetImage(e.image),
                    fit: BoxFit.cover,
                  )),
            ),
            Align(
                alignment: Alignment.topLeft,
                child:CircleAvatar(
                  radius:30,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(e.image),
                    radius: 27,
                  ),
                ),),
          ],
        ),
        SizedBox(height: 5),
        Center(
          child: Text(
            "${e.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}


Widget buildpost({post p, BuildContext context,bool color_like,i}){
  return Column(
    children: [
      Row(
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
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.centerLeft,child: Text("${p.content}",style: styleText(fontsize: 16),)),
      ),
      p.img==null?Text(""):Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Image(height: 250,width: double.infinity,image:ExactAssetImage(p.img),fit: BoxFit.cover),
      ),
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
