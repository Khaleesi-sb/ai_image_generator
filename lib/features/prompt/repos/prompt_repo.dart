import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PromptRepo {
  static Future<File?> generateImage(String prompt) async{
    String url = "https://api.vyro.ai/v2/image/generations";
    Map<String, dynamic> header = {
      "Authorization" : "Bearer ${dotenv.env['AUTH_KEY'] ?? ''}"
    };
    final FormData payload = FormData.fromMap({
      "prompt": prompt,
      "style": "realistic",
    });
    try{
      Dio dio = Dio();
      dio.options = BaseOptions(
        headers: header,
      );
      final Response response = await dio.post(
        url,
        data: payload,
      );
      if(response.statusCode==200){
        File file = File("image.jpg");
        file.writeAsBytesSync(response.data);
        return file;
      }
    } catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}