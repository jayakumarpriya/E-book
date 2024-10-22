 import 'dart:convert';

import 'package:ebook/module/List/listpage.dart';
import 'package:ebook/module/auth/userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

abstract class LoginState {
    
  }
 class LoginInitial extends LoginState {
    
  }
  class LoginLoading extends LoginState {
    
  }
   class LoginSuccess extends LoginState {
    
  }
   class LoginError extends LoginState {
    
  }

  class Loginblocfun extends Cubit<LoginState> {


     Loginblocfun() : super(LoginInitial());
     final formkey = GlobalKey();
var emailregex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
TextEditingController email = new TextEditingController();
TextEditingController password = new TextEditingController();
String emailtext ="";
String passwordtext ="";
bool visible = true;


emailvalidation(){

  if(email.text.isEmpty){

emailtext ="Enter Your Email";
emit(LoginSuccess());
  }else if(emailregex.hasMatch(email.text)){
    emailtext="";
emit(LoginSuccess());
  }else{
     emailtext="Enter Valid Email id";
     emit(LoginSuccess());
  }
}
passwordvalidation(){

  if(password.text.isEmpty){

passwordtext ="Enter Your password";
emit(LoginSuccess());
  }else{
     emailtext="";
     emit(LoginSuccess());
  }
}
login(context) async {
  loading = false;
  emit(LoginLoading());
 try {
  var req={
    "name":email.text,
    "password":password.text
  };
    Provider.of<UserValues>(context,listen: false).getuserdata(req);

   loading = true;
   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ListPage()));
   emit(LoginSuccess());
 } catch (e) {
   loading = true;
   emit(LoginSuccess());
 }
}
bool loading = true;
  }