import 'package:flutter/material.dart';
import 'package:untitled16/newsmodule.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('News'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _size.height*0.35,
                width: double.infinity,
                color: Colors.green,
                child: Image(image: NetworkImage(article.urlToImage),fit: BoxFit.cover,),
              ),
              ListTile(
                title: Text(article.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                subtitle: Text(article.author, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

              ),
              SizedBox(height: _size.height*0.01,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width*0.04),
                child: Text(article.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
