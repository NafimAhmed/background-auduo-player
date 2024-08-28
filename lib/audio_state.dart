import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class AudioState extends ChangeNotifier {
  late AudioPlayer player;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


    player.dispose();
  }


  final playlist = ConcatenatingAudioSource(children: [
    ClippingAudioSource(
      start: Duration(seconds: 0),
      end: Duration(seconds: 90),
      child: AudioSource.uri(
        Uri.parse(
            'https://res.cloudinary.com/dnzhxznox/video/upload/v1724405518/seg1edqe3t50ypfbrsr7.mp3'),
      ),
      tag: MediaItem(id: '0', title: 'title',album: 'Album',
      artUri: Uri.parse('https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2016/12/ok-jaanu-1481374642.jpg')

      ),

    )
  ]);



  AudioState(){
    player=AudioPlayer();

    _init();
  }

  Future<void> _init() async {
    player.playbackEventStream.listen((event){},onError:(Object e, StackTrace stacktrace){
      debugPrint('==================${e}=============================');
    } );

    try{
      await player.setAudioSource(playlist);
    }catch(e){
      debugPrint('==================${e}=============================');
    }




  }


}
