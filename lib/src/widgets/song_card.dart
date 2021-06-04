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
          _image(context),
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

  Widget _image(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(190),
        border: Border.all(color: Theme.of(context).accentColor, width: 6),
        image: DecorationImage(
            image: NetworkImage(image), fit: BoxFit.cover, scale: 8),
      ),
    );
  }
}
