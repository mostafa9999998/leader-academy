import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/register/textfield_pass.dart';
import 'package:leader_academy/ui/register/textfirld_wedget.dart';
import 'package:leader_academy/ui/utiles/loading.dart';
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
  late String selectedyear;
  List<String> yearslist = [ 'الصف الاول الثانوي','الصف الثاني الثانوي','الصف الثالث الثانوي'];
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
                   SizedBox(height:  MediaQuery.of(context).size.height*.05,),
                   Center(child: Container(
                       height: MediaQuery.of(context).size.height*.1,
                       width: MediaQuery.of(context).size.width*.99,
                       child: Image(image:AssetImage('assets/images/logoappp.png'),fit: BoxFit.fill,))),
                   SizedBox(height:  MediaQuery.of(context).size.height*.02,),


                   Textform(title: 'Name', hint: 'Mohamed Hussien',controller: namecontroller,
                   validator: (value) {
                     if (value!.isEmpty || value.trim().isEmpty){
                       return "your name can't be empty";
                     }
                   },),
                   // Textform(title: 'Last Name', hint: 'Hussien',controller: namecontroller,
                   // validator: (value) {
                   //   if (value!.isEmpty || value.trim().isEmpty){
                   //     return "your last name can't be empty";
                   //   }
                   // },),
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

                   Text('Educational Level.',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold ),),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10 ),
                     child: DropdownButtonFormField2<String>(
                       isExpanded: true,
                       decoration: InputDecoration(
                         // Add Horizontal padding using menuItemStyleData.padding so it matches
                         // the menu padding when button's width is not specified.
                         contentPadding:
                         const EdgeInsets.symmetric(
                             vertical: 16),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15),
                         ),
                         // Add more decoration..
                       ),
                       hint: const Text(
                         'Select Your level',
                         style: TextStyle(fontSize: 14),
                       ),
                       items: yearslist
                           .map((item) => DropdownMenuItem<String>(
                         value: item,
                         child: Text(
                           item,
                           style: const TextStyle(
                             fontSize: 14,
                           ),
                         ),
                       ))
                           .toList(),
                       validator: (value) {
                         if (value == null) {
                           return 'Please select your level.';
                         }
                         return null;
                       },
                       onSaved: (value) {
                         setState(() {
                           selectedyear = value.toString();
                         });
                       },
                       onChanged: (value) {
                         setState(() {
                           selectedyear = value.toString();
                         });
                       },
                       buttonStyleData: const ButtonStyleData(
                         padding: EdgeInsets.only(right: 8),
                       ),
                       iconStyleData: const IconStyleData(
                         icon: Icon(
                           Icons.arrow_drop_down,
                           color: Colors.black45,
                         ),
                         iconSize: 24,
                       ),
                       dropdownStyleData: DropdownStyleData(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                         ),
                       ),
                       menuItemStyleData: const MenuItemStyleData(
                         padding:
                         EdgeInsets.symmetric(horizontal: 16),
                       ),
                     ),
                   ),

                   SizedBox(height:  MediaQuery.of(context).size.height*.04,),

                   Container(
                     width: MediaQuery.sizeOf(context).width*0.9,
                      height:MediaQuery.sizeOf(context).width*0.15 ,
                     child: ElevatedButton(onPressed: (){
                       register();
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
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async{
    if (formkey.currentState?.validate()==true){
      try{
      showLoading(context);
      var R = Apimanager.register(namecontroller.text,selectedyear, phonecontroller.text, passwordcontroller.text);

      if(await R){
        hideLoading(context);
        //showsucsses(context, 'User added successfully');
        Navigator.pushReplacementNamed(context, Loginscreen.loginroutename);
      } else{
        hideLoading(context);
        showerror(context, 'Email already exists');
      }
      }
          catch(e){
            hideLoading(context);
            showerror(context, 'Some thing went wrong');
            // showerror(context,e.toString());
          }
    }
  }

}
