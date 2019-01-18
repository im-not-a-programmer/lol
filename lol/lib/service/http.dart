import 'package:http/http.dart' as http;
import 'dart:convert';

getBanners() async{
  String url = "http://www.wanandroid.com/banner/json";

  String errorMsg;
  int errorCode;
  var data;
  try {
    http.Response res = await http.get(url);
    if(res.statusCode!=200){
      errorMsg = "请求错误,错误码"+res.statusCode.toString();
      print(errorMsg);
      return;
    }
    Map<String, dynamic> map = json.decode(res.body);
    errorCode = map['errorCode'];
    errorMsg = map['errorMsg'];
    data = map['data'];
    if(errorCode<0){
      print(errorMsg);
      return;
    }
    //这里偷懒直接打印数据
    print("data:" + data.toString());
  }catch(exception){
    print(exception.toString());
  }
}