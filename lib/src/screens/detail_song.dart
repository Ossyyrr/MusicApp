import 'package:base/src/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSong extends StatelessWidget {
  const DetailSong({Key? key, required this.data}) : super(key: key);
  final TrackModel data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _image(data.track.images.coverart),
              Text(data.track.url),
              Text(data.track.title),
              Text(data.track.artist),
              ElevatedButton(
                  onPressed: () async => {
                        await launch(
                          data.track.url,
                          forceSafariVC: false,
                        )
                      },
                  child: Text('redirección'))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _image(String image) {
  return Container(
    width: 250,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      image: DecorationImage(
          image: NetworkImage(image), fit: BoxFit.cover, scale: 8),
    ),
  );
}
