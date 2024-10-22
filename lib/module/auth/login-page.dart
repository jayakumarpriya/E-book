import 'package:ebook/module/auth/login-bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) =>Loginblocfun(),child:const LoginBloc() ,);
  }
}

class LoginBloc extends StatefulWidget {
  const LoginBloc({super.key});

  @override
  State<LoginBloc> createState() => _LoginBlocState();
}

class _LoginBlocState extends State<LoginBloc> {
late Loginblocfun authbloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authbloc = BlocProvider.of<Loginblocfun>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Loginblocfun , LoginState>(builder: (Loginblocfun,state){

      if(state is LoginLoading){return Container();}else{return Scaffold
      
      (body: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login Your Account",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold
            ),),
          Container(
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)
            ),
            child: TextFormField(
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: "Enter Email",contentPadding: EdgeInsets.only(left: 10),hintStyle: TextStyle(
                  fontSize: 14
                ),
                border: InputBorder.none
              ),
            controller: authbloc.email,
            // validator: (value){
            //   if(value!.isEmpty){
            //     return "Enter Your Email";
            //   }else if (authbloc.emailregex.hasMatch(value)){return "";}else{
            //     return "Enter Valid Email Id";
            //   }
            // },
            onChanged: (v){
              // authbloc.formkey.currentState!.validate();
              authbloc.emailvalidation();
            },
            ),
          ),
          Visibility(
            visible: authbloc.emailtext.isNotEmpty,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(authbloc.emailtext,style: const TextStyle(
                fontSize: 10,color: Colors.red
              ),),
            )),
            
            Container(
              margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)
            ),
            child: TextFormField(
              maxLines: 1,obscuringCharacter: '*',obscureText : authbloc. visible ,
              decoration:  InputDecoration(
                suffixIcon: IconButton(onPressed: (){
authbloc. visible = !authbloc. visible;
setState(() {
  
});
                }, icon: Icon(authbloc. visible?Icons.visibility_off :Icons.visibility)),
                hintText: "Enter Password",contentPadding: const EdgeInsets.only(left: 10,top: 
                10),hintStyle: const TextStyle(
                  fontSize: 14
                ),
                border: InputBorder.none
              ),
            controller: authbloc.password,
            // validator: (value){
            //   if(value!.isEmpty){
            //     return "Enter Your Email";
            //   }else if (authbloc.emailregex.hasMatch(value)){return "";}else{
            //     return "Enter Valid Email Id";
            //   }
            // },
            onChanged: (v){
              // authbloc.formkey.currentState!.validate();
              authbloc.passwordvalidation();
            },
            ),
          ),
          Visibility(
            visible: authbloc.passwordtext.isNotEmpty,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(authbloc.passwordtext,style: const TextStyle(
                fontSize: 10,color: Colors.red
              ),),
            )),
const SizedBox(height: 40,),
            ElevatedButton(
              style:ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.purple[900])
              ) ,
              onPressed: (){
                if(authbloc.passwordtext.isEmpty&&authbloc.emailtext.isEmpty&&authbloc.email.text.isNotEmpty&&authbloc.email.text.isNotEmpty){
                  authbloc.login(context);
                }else{

                  Fluttertoast.showToast(
        msg: "Fill All the data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                }
              }, child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width-200,
                child: const Center(
                  child: Text("Login",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,color: Colors.white
                              ),),
                ),
              ))
          ],
              ),
        ),
      )); }
    });
  }
}

 