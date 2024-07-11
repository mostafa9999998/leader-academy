import 'package:flutter/material.dart';
import 'package:leader_academy/ui/register/textfield_pass.dart';
import 'package:leader_academy/ui/register/textfirld_wedget.dart';
import 'package:leader_academy/ui/testmacaddress.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});
  static const String regroutename ='regname';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState>  formkey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        return false ;
      },
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   SizedBox(height:  MediaQuery.of(context).size.height*.12,),
                   Center(child: Container(
                       height: MediaQuery.of(context).size.height*.1,
                       width: MediaQuery.of(context).size.width*.99,
                       child: Image(image:AssetImage('assets/images/logoappp.png'),fit: BoxFit.fill,))),
                   SizedBox(height:  MediaQuery.of(context).size.height*.08,),
                   Textform(title: 'Full Name', hint: 'name',controller: namecontroller,
                   validator: (value) {
                     if (value!.isEmpty || value.trim().isEmpty){
                       return "your name can't be empty";
                     }
                   },),


                   Textform(title: 'Phone number', hint: 'phone number',
                       keyboardtype: TextInputType.phone,controller:phonecontroller ,validator: (value) {
                       if (value!.isEmpty || value.trim().isEmpty){
                         return "your phone number can't be empty";
                       }else if (value.length < 11){
                         return'phone shoud be at least 11 Characters';
                       }
                     },),
                   Textformpass(title: 'Password', hint: 'Your password',iconpath: 'assets/images/eye password logo.png',
                       valiedstring: "password can't be empty",controller: passwordcontroller),
                   SizedBox(height:  MediaQuery.of(context).size.height*.04,),

                   Container(
                     width: MediaQuery.sizeOf(context).width*0.9,
                      height:MediaQuery.sizeOf(context).width*0.15 ,
                     child: ElevatedButton(onPressed: (){
                      // register();
                     },
                         child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                       style: ElevatedButton.styleFrom(
                           backgroundColor:Color(0xff2eca71),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15))),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Already have account',style: TextStyle(fontSize: 18)),
                       InkWell(onTap:() {
                         Navigator.pushReplacementNamed(context, Loginscreen.loginroutename);
                       },child: Text('  sign in ',style: TextStyle(color: Color(0xff8362D7),fontSize: 18)))
                     ],
                   ),
                   ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context,MacAddresScren.MacAddresScrenname),
                       child: Text('show mack address')
                   )
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void register() async{
  //   if (formkey.currentState?.validate()==true){
  //     try{
  //     showLoading(context);
  //     var R = Apimanager.register(namecontroller.text, emailcontroller.text, phonecontroller.text, passwordcontroller.text);
  //
  //     if(await R){
  //       hideLoading(context);
  //       //showsucsses(context, 'User added successfully');
  //       Navigator.pushReplacementNamed(context, Loginscreen.loginroutename);
  //     } else{
  //       hideLoading(context);
  //       showerror(context, 'Email already exists');
  //     }
  //     }
  //         catch(e){
  //           hideLoading(context);
  //           showerror(context, 'Some thing went wrong');
  //         }
  //   }
  // }
}
