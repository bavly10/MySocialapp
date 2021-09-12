import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_app/cubit/My_Observer.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/modules/Splash_Screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>Social_Cubit()),
      ],
      child: BlocConsumer<Social_Cubit,Social_States>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           title: 'Social App',
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             primarySwatch: Colors.blue,
           ),
           home: SplashScreen(),
         );
       },
      ),
    );
  }
}