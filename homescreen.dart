
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/widgets/movies_slider.dart';
import 'package:netflix/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movies>>trendingMovies;
  late Future<List<Movies>>upcomingMovies;
  late Future<List<Movies>>topratedMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    upcomingMovies = Api().getUpComingMovies();
    topratedMovies = Api().getTopRatedMovies();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Image.asset('assets/Netflix_logo.png'),
           centerTitle: true,
           elevation: 0,
            actions: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 40,
            child: Image.asset('assets/logo.png'),
          ),
        ],
        ),
      bottomNavigationBar: const _CustomNavBar(),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Trending Movies',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32,),
              SizedBox(
                child: FutureBuilder(
                  future:trendingMovies,
                   builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(
                          snapshot.error.toString()
                        ),
                      );
                    }else if(snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    }else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                   }),

              ),

              const SizedBox(height: 32),
              const Text("Top rated movies",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                child: FutureBuilder(
                    future:topratedMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(
                              snapshot.error.toString()
                          ),
                        );
                      }else if(snapshot.hasData) {
                        return MoviesSlider(snapshot: snapshot);
                      }else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),

              ),
              const SizedBox(height: 32),
              const Text("Upcoming movies",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                    future:upcomingMovies,
                    builder: (context,snapshot){
                      if(snapshot.hasError){
                        return Center(
                          child: Text(
                              snapshot.error.toString()
                          ),
                        );
                      }else if(snapshot.hasData) {
                        return MoviesSlider(snapshot: snapshot);
                      }else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/HomeScreen');
        break;
      case 1:
        Navigator.pushNamed(context, '/Search');
        break;
      case 2:
        Navigator.pushNamed(context, '/Download');
        break;
      case 3:
        Navigator.pushNamed(context, '/More');
        break;

    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Download'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: 'More'),
        ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}

