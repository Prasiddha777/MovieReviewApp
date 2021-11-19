import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';

import '../descripition.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Trending Movies"),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Descripition(
                                  name: trending[index]['title'],
                                  descripition: trending[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  voter: trending[index]['vote_average']
                                      .toString(),
                                  launch_on: trending[index]['release_date'],
                                )));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: Modified_Text(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'loading',
                            color: Colors.white,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
