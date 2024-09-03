import 'package:flutter/material.dart';
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
        title:Text('Error!') ,
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

String showcodefield(BuildContext context,String entercodemessage,){
  String? code;
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
      return  AlertDialog(
        title:Text('Code !') ,
        content: Container(
          height: MediaQuery.of(context).size.height*0.08,
          child: Column(
            children: [
              //Text(entercodemessage),
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
          TextButton(onPressed: () {
            Navigator.pop(context);
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