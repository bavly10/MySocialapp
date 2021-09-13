import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/layout/layout.dart';
import 'package:social_app/modules/Tab_bar%20modules/Groups.dart';
import 'package:social_app/modules/Tab_bar%20modules/Market_place.dart';
import 'package:social_app/modules/Tab_bar%20modules/Notifactions.dart';
import 'package:social_app/modules/Tab_bar%20modules/Posts_Screen.dart';
import 'package:social_app/modules/Tab_bar%20modules/Setting.dart';
import 'package:social_app/modules/Tab_bar%20modules/Watch.dart';
import 'package:social_app/shared/MyColors.dart';
import 'package:social_app/shared/styles.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Social_Cubit,Social_States>(
      listener: (context,state){},
      builder: (context,state){
        return DefaultTabController(
          length: 6,
          child: Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                    handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: true,
                    snap: true,
                    title: Text("facebook", style: styleText(fontWeight: FontWeight.bold, fontsize: 28, color: Colors.blue.shade600),),
                    actions: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              MdiIcons.facebookMessenger,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                    centerTitle: false,
                    bottom: TabBar(
                      indicatorColor: Colors.blue,
                      indicatorWeight: 2,
                      tabs: [
                        Tab(
                          icon: Icon(
                           MdiIcons.home,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.accountGroupOutline,
                            color: myBlack_icon_TabBar,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.ondemand_video,
                            color: myBlack_icon_TabBar,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.card_giftcard,
                            color: myBlack_icon_TabBar,
                            size: 30,
                          ),
                        ),
                        Tab(
                         child: iconNotification(),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.menu,
                            color: myBlack_icon_TabBar,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                children: [
                  Posts_Screen(),
                  Groups_Screen(),
                  Watch_Screen(),
                  Market_place_Screen(),
                  Notif_Screen(),
                  Setting_Screen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
