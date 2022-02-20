import 'package:flutter/material.dart';
import 'package:untitled16/api_manager.dart';
import 'package:untitled16/newsdetails.dart';
import 'package:untitled16/newsmodule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<NewsModule>? _newsData;
  @override
  void initState(){
    _newsData = ApiManager().getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<NewsModule>(
        future: _newsData,
        builder: (context, snapshot) {
          if(snapshot.hasData){

            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context,index){
                  var article = snapshot.data!.articles[index];
                  return Card(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>NewsDetails(article: article,)));
                      },
                      child: Container(
                        height: 300,
                        color: Colors.grey.withOpacity(0.45),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              color: Colors.red,
                              child: Image(image: NetworkImage(article.urlToImage),fit: BoxFit.cover,),
                            ),

                            Container(
                              height: 100,
                              color: Colors.white,
                              width: double.infinity,
                              child: ListTile(
                                title:Text(article.title, maxLines: 1, overflow: TextOverflow.ellipsis,),
                                subtitle: Text(article.author),

                              ),

                            )
                          ],
                        ),

                      ),
                    ),
                  );
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
      ),
    ));
  }
}
