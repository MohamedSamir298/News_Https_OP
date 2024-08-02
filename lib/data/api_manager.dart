import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/articles_response.dart';
import '../model/sources_response.dart';

abstract class ApiManager{

  static const String  baseUrl = 'newsapi.org';
  static const String apiKey = '54b287156fda484fb907c6d67e2dd204';

  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': apiKey});
    var response = await http.get(url);
    //print('response1 = ${response.body}');
    Map json = jsonDecode(response.body);
    SourcesResponse responseDM = SourcesResponse.fromJson(json);
    return responseDM;
  }

  static Future<ArticlesResponse> getArticles(String sourceId)async{
   Uri url = Uri.https(baseUrl,'v2/everything',{'apiKey':apiKey,'sources':sourceId});
   var response = await http.get(url);
   //print('response2 = ${response.body}');
   Map json = jsonDecode(response.body);
   ArticlesResponse responseDM = ArticlesResponse.fromJson(json);

   return responseDM;
  }
}