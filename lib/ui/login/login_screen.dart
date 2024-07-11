import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials/materials%20screen.dart';
import '../register/register_screen.dart';
import '../register/textfield_pass.dart';
import '../register/textfirld_wedget.dart';



class Loginscreen extends StatefulWidget {
   Loginscreen({super.key});
  static const String loginroutename ='login';

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
   TextEditingController phonecontroller = TextEditingController();

   TextEditingController passwordcontroller = TextEditingController();

  GlobalKey<FormState> formk = GlobalKey();
   bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()async {
          return false ;
        },
        child: Form(
          key: formk,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:30 ,vertical:20 ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height:  MediaQuery.of(context).size.height*.12,),
                  Center(child: Container(
                      height: MediaQuery.of(context).size.height*.1,
                      width: MediaQuery.of(context).size.width*.99,
                      child: Image(image:AssetImage('assets/images/logoappp.png'),fit: BoxFit.fill,))),
                  SizedBox(height: MediaQuery.of(context).size.height*.1,),
                  //Text('Email address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  Container(
                    child:  Textform(title: 'Phone number', hint: 'phone number',
                      keyboardtype: TextInputType.phone,controller:phonecontroller ,validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty){
                          return "your phone number can't be empty";
                        }else if (value.length < 11){
                          return'phone shoud be at least 11 Characters';
                        }
                      },),
                  ),
                  SizedBox(height: 15,),
                 // Text('Password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  Container(
                    child: Textformpass(title: 'Password', hint: 'Your password',iconpath: 'assets/images/eye password logo.png',
                        valiedstring: "password can't be empty",controller: passwordcontroller),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                     // Navigator.pushNamed(context, Emailscreen.emailroutename);
                    },
                      child: Text('Forget Password?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20, color: Color(0xff8362D7)),textAlign: TextAlign.end,)),
                  SizedBox(
                    height: 25,
                  ),
                   Container(
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height:MediaQuery.sizeOf(context).width*0.15 ,
                    child: ElevatedButton(onPressed: (){
                     // login();
                      Navigator.pushReplacementNamed(context, MaterialsScreen.MaterialsScreenname);
                    },
                      child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xff2eca71),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text("     Don't have account  ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                      InkWell(
                          onTap: (){
                           Navigator.pushReplacementNamed(context, RegisterScreen.regroutename);
                          },
                          child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20, color: Color(0xff8362D7)),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void login() async {
  //   if (formk.currentState?.validate()==true){
  //     try{
  //       showLoading(context);
  //       var R = Apimanager.login(emailcontroller.text,passwordcontroller.text);
  //       LoginResponse loginresponse = await Apimanager.loginresponse(emailcontroller.text,passwordcontroller.text);
  //           Mainprovider providr = Provider.of<Mainprovider>(context,listen: false);
  //          providr.fgetuserid(emailcontroller.text,passwordcontroller.text);
  //       if(await R){
  //         hideLoading(context);
  //         providr.setloginid(loginresponse.user!.id!);
  //         providr.setloginemail(loginresponse.user!.email!);
  //         providr.setloginname(loginresponse.user!.name!);
  //         providr.setloginmesage(loginresponse.message!);
  //         providr.setloginupdated(loginresponse.user!.updatedAt!);
  //         providr.setlogincreated(loginresponse.user!.createdAt!);
  //         providr.setloginphone(loginresponse.user!.phone!);
  //         Navigator.pushReplacementNamed(context, Selectscreen.selectname);
  //       } else{
  //         hideLoading(context);
  //         showerror(context, 'Email or Password is incorrect');
  //       }
  //     }
  //     catch(e){
  //       hideLoading(context);
  //       showerror(context, e.toString());
  //     }
  //   }
  // }
}