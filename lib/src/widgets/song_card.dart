import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  const SongCard(
      {Key? key,
      required this.title,
      required this.artist,
      required this.image})
      : super(key: key);
  final String title;
  final String artist;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 1.2),
            ),
            child: Image.network(
              image,
              width: 60,
            ),
          ),
          SizedBox(width: 8),
          Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    artist,
                    softWrap: true,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
