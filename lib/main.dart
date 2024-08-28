import 'package:bacground_player/audio_state.dart';
import 'package:bacground_player/home.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

void main() {

  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.example.bacground_player',
  //   androidNotificationChannelName: 'Audio Play',
  //   androidNotificationOngoing: true
  // );


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {







  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    initMusic();
  }

  Future<void> initMusic() async {
    await JustAudioBackground.init(
        androidNotificationChannelId: 'com.example.bacground_player',
        androidNotificationChannelName: 'Audio Play',
        androidNotificationOngoing: true
    );
  }




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    initMusic();


    return ChangeNotifierProvider(
      lazy: false,
      create: (_)=>AudioState(),
      child:   MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );





  }
}


