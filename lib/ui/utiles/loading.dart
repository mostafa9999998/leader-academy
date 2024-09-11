import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';
//import 'package:motherly_moments/data/repo/apis/baby%20groth/Api%20manager.dart';

//import '../../data/repo/moduls/register/RegisterResponse.dart';

void showLoading(BuildContext context){
showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
  return const AlertDialog(
    content: Row(
      children: [
        Text('Loading...'),
        Spacer(),
        CircularProgressIndicator()
      ],
    ) ,
  );
    },
);
}
void hideLoading(BuildContext context){
  Navigator.pop(context);
}
void showerror(BuildContext context,String errormessage,){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        title:Text('Ops!') ,
        content: Text(errormessage) ,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text('Ok') )
        ],
      );
    },
  );
}

String showcodefield(BuildContext context,String entercodemessage,String? codemessage,){
  String? code;
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
    MainProvider provider = Provider.of(context);
      return  AlertDialog(
        title:Text(codemessage??'') ,
        content: Container(
          height: MediaQuery.of(context).size.height*0.08,
          child: Column(
            children: [
              //Text(,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
              TextFormField(
                decoration: InputDecoration(
                  hintText: entercodemessage
                ),
                onChanged: (value) {
                code = value;
                },
              ),
            ],
          ),
        ) ,
        actions: [
          TextButton(onPressed: () async {
            String macAddress2 = await Apimanager.getMacAddress()??'0000';
            var validresponse=await Apimanager.validatecode("${provider.loginResponse.user!.id}", code??"", "${provider.packageid}", macAddress2);
            print(provider.loginResponse.user!.id);
            print(code);
            print(provider.packageid);
            print( macAddress2);
            if (validresponse.message == 'Invalid code.'){
              showerror(context,"invalid code ");
            }else  if (validresponse.message == 'Code is already used .'){
              showerror(context,"Code is already used.");
            }else if (validresponse.errors!.code![0] == 'The code field is required.'){
              showerror(context,"The code field is required.");
            }else{

              Navigator.pushReplacementNamed(context, MaterialsLessonScreen.MateriallessonScreenname);
            }
          },
              child:Text('Ok') )
        ],
      );
    },
  );
  return code??'' ;
}

void showsucsses(BuildContext context,String message,){
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        content: Text(message,style: TextStyle(fontSize: 20)) ,
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child:Text('Ok') )
        ],
      );
    },
  );
}



/*showresult(BuildContext context,String name,String email,String phone,String password){
  FutureBuilder<RegisterResponse>(
    future: Apimanager.register(name, email, phone, password),
    builder: (context, snapshot) {
      if (snapshot.hasData){
        return AlertDialog(
          content: Text(snapshot.data?.message??'try again') ,
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            },
                child:Text('Ok') )
          ],
        );
      } else if (snapshot.hasError){
        return Text(snapshot.error.toString());
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}*/