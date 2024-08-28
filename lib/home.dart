



import 'package:bacground_player/audio_state.dart';
import 'package:bacground_player/controll_button.dart';
import 'package:bacground_player/current_music_info.dart';
import 'package:bacground_player/main.dart';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    final audioState=context.watch<AudioState>();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('background'),
      ),
      body: Column(
        children: [
          
          
          Expanded(child: StreamBuilder<SequenceState?>(
              stream: audioState.player.sequenceStateStream,
              builder: (context,snapshot){



            final state=snapshot.data;

            if(state?.sequence.isEmpty??true){
              return SizedBox.shrink();
            }



            return CurrenTMusicInfo(state!.currentSource!.tag as MediaItem);
          },),),


          ControllButton(audioState.player),

          SizedBox(
            height: 300,
            child: StreamBuilder<SequenceState?>(stream: audioState.player.sequenceStateStream, builder: (context,snapshot){
              if(snapshot.hasData){

                final state=snapshot.data;
                final sequence=state?.sequence??[];
                
                
                return ListView.builder(itemBuilder: (context,index){
                  return ListTile(
                    title: Text("data"),
                    onTap: (){

                      audioState.player.seek(Duration.zero,index: index);


                    },
                  );
                });

              }

              return CircularProgressIndicator();


            }),
          )

        ],
      ),
    );
  }

}