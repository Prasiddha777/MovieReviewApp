import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';

class TV extends StatelessWidget {
  final List tvshows;
  const TV({Key? key, required this.tvshows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Popular TV Shows"),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshows.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    tvshows[index]['poster_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Modified_Text(
                            text: tvshows[index]['original_name'] != null
                                ? tvshows[index]['original_name']
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
