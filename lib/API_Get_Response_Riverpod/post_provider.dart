import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_learning/API_Get_Response_Riverpod/Model/post_model.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async{
    try{
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        List<PostModel> postsList = data.map((item) => PostModel.fromJson(item)).toList();
        return postsList;
      }else{
        throw "Something went Wrong";
      }
    } on SocketException{
      throw "No Internet Available";
    }
    catch(e){
      rethrow;
    }
});
