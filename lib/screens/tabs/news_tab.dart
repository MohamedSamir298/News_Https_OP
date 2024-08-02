import 'package:flutter/material.dart';
import 'package:news/data/api_manager.dart';
import 'package:news/model/articles_response.dart';
import 'package:news/model/sources_response.dart';
import 'package:news/screens/tabs/tab_content.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  bool isSelected = false;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return ShowScreenBody(snapshot.data?.sources?? []);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget ShowScreenBody(List<Sources> sources) {
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TabBar(
              tabs: sources
                  .map((e) => getTabs(e, sources.indexOf(e) == currentIndex))
                  .toList(),
              isScrollable: true,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
            ),
            Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                    children: sources.map((e) {
                      return TabContent(e);
                    }).toList()))
          ],
        ));
  }

  Widget getTabs(Sources source, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xff39A552) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xff39A552))),
      child: Text(
        source.name ?? 'unknown',
        style: TextStyle(color: isSelected ? Colors.white : Color(0xff39A552)),
      ),
    );
  }
}
