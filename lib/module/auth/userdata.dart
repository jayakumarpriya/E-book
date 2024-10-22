import 'package:flutter/material.dart';

class UserValues with ChangeNotifier {
  
   var userdata ={};
   getuserdata(v){
userdata = v;
notifyListeners();
   }
}
class Setvalues extends ChangeNotifier {
  
   var userdata ={};
   getuserdata(v){
userdata = v;
notifyListeners();
   }
}