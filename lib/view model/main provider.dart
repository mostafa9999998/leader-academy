import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
String videourl = '';
String pdfurl = '';
String getvideourl (){
  return videourl ;
}
void setvideourl (String url ){
  videourl = url;
}
String getpdfourl (){
  return pdfurl ;
}
void setpdfurl (String url ){
  pdfurl = url;
}
}