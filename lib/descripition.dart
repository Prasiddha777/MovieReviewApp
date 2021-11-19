import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';

class Descripition extends StatelessWidget {
  const Descripition({
    Key? key,
    required this.name,
    required this.descripition,
    required this.bannerurl,
    required this.posterurl,
    required this.voter,
    required this.launch_on,
  }) : super(key: key);

  final String name, descripition, bannerurl, posterurl, voter, launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: ListView(
        children: [
          Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 10,
                    child: Modified_Text(
                      text: '⭐  Avergae Rating - ' + voter,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Modified_Text(
              text: name != null ? name : 'Not Loaded',
              size: 18,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Modified_Text(
              text: 'Releasing on - ' + launch_on,
              size: 11,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Modified_Text(
                      text: descripition,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
