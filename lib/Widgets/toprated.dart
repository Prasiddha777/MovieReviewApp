import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;
  const TopRatedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Top Rated"),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
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
                                      toprated[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: Modified_Text(
                            text: toprated[index]['title'] != null
                                ? toprated[index]['title']
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
