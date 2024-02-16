import 'package:flutter/material.dart';
import 'package:netflix/constants.dart';
import 'package:netflix/models/movies.dart';

import '../widgets/back_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movies.title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movies.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color:Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    movies.overview,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'Release Date:',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                movies.releaseDate,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Row(
                            children: [
                              const Text('Rating',
                                style: TextStyle(
                                     fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              const Icon(Icons.star,color: Colors.amber,
                              ),
                              Text('${movies.voteAverage.toStringAsFixed(1)}/10'
                                  ,style:TextStyle(color: Colors.white
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

