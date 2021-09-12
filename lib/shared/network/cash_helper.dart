import 'package:shared_preferences/shared_preferences.dart';

class Cash_helper{

  static SharedPreferences sharedPreferences;
  static init () async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> putData(String key,String value) async{
   return await sharedPreferences.setString( key,value);
  }

  static String getData(String key,)
  {
    return  sharedPreferences.getString(key);
  }

}