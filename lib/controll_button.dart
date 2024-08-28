



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ControllButton extends StatelessWidget{


  final AudioPlayer player;

  const ControllButton(this.player,{super.key, });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        StreamBuilder<SequenceState?>(stream: player.sequenceStateStream, builder: (context,snapshot)=>IconButton(
            onPressed: player.hasPrevious?player.seekToPrevious:null,
            icon: Icon(Icons.skip_previous))),



        StreamBuilder<PlayerState?>(stream: player.playerStateStream, builder: (context,snapshot){
          final playState=snapshot.data;
          final processingState=playState?.processingState;
          final playing=playState?.playing;

          if(processingState==ProcessingState.loading || processingState==ProcessingState.buffering){
            return CircularProgressIndicator();
          }
          if(playing!=true){
            return IconButton(onPressed: player.play, icon: Icon(Icons.play_arrow));
          }

          if(processingState!=ProcessingState.completed){
            return IconButton(onPressed: player.play, icon: Icon(Icons.pause));
          }


          return IconButton(onPressed: ()=>player.seek(
            Duration.zero,
            index: player.effectiveIndices!.first
          ), icon: Icon(Icons.replay));



        }),


        StreamBuilder<SequenceState?>(stream: player.sequenceStateStream, builder: (context,snapshot)=>IconButton(
            onPressed: player.hasNext?player.seekToNext:null,
            icon: Icon(Icons.skip_next)))

      ],
    );
  }
}