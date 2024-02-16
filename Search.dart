import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/widgets/back_button.dart';
import 'package:netflix/models/movies.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List< Movies>> searchMovies;

  @override
  void initState() {
    super.initState();
    searchMovies = Api().getSearchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackBtn(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
                suffixIcon: Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
                style: TextStyle(color: Colors.grey),
                onChanged: (query) {

                },
              ),
              SizedBox(height: 20),
              FutureBuilder<List<Movies>>(
                future: searchMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title),
                            
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text('No data found'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
