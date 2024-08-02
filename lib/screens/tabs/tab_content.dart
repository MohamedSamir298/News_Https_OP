import 'package:flutter/material.dart';
import 'package:news/model/sources_response.dart';

import '../../data/api_manager.dart';
import '../../model/articles_response.dart';

class TabContent extends StatelessWidget {
 Sources source;
 TabContent(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
          future: ApiManager.getArticles(source.id!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                  itemBuilder:(context,index){
                  return buildArticlesWidget(snapshot.data!.articles![index]);
                  } );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
 Widget buildArticlesWidget(Article article){
   return Column(
     children: [
       Image.network(article.urlToImage??'https://yxj.ca/wp-content/themes/np/images/placeholder-thumbnail.png'),
       SizedBox(height: 4,),
       Text(article.author,textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.grey[500]),),
       SizedBox(height: 4,),
       Text(article.title??'',textAlign: TextAlign.start ,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,)),
       SizedBox(height: 4,),
       Text(article.publishedAt??'',textAlign: TextAlign.end ,style: TextStyle(fontSize: 12,color: Colors.grey[500]),),
     ],
   );

 }
  }

