import 'package:flutter/cupertino.dart';
import 'package:just_audio_background/just_audio_background.dart';

class CurrenTMusicInfo extends StatelessWidget {
  final MediaItem mediaItem;

  const CurrenTMusicInfo(this.mediaItem, {super.key,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Image.network(mediaItem.artUri.toString()),
          ),
        ),


        Text(mediaItem.album??''),


      ],
    );
  }
}
