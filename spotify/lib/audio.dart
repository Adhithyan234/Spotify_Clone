import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotify/utils/Notify.dart';

class AudioPlayerPro extends StatefulWidget {
  AudioPlayerPro(
      {required this.audioURL, required this.image, required this.name});

  final String audioURL;
  final String image;
  final String name;

  @override
  State<AudioPlayerPro> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayerPro> {
  Notify notify = Get.find();

  Duration _duration = Duration();
  Duration _position = Duration();

  static AudioPlayer advancedplayer = AudioPlayer();

  @override
  void initState() {
    initplayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initplayer() {
    advancedplayer = AudioPlayer();
    advancedplayer.onDurationChanged
        .listen((d) => setState(() => _duration = d));

    advancedplayer.onPositionChanged
        .listen((p) => setState(() => _position = p));
  }

  void seekToSecond(second) {
    Duration newDuration = Duration(seconds: second);
    advancedplayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedplayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.brown, Colors.black87])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    LineIcons.angleDown,
                    color: Colors.white,
                    size: 24,
                  ),
                  Column(
                    children: [
                      Text(
                        'PLAYING FROM ALBUM',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 11,
                            color: Colors.white),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    LineIcons.verticalEllipsis,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(widget.image)),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              wordSpacing: 1,
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Classics',
                          style: TextStyle(
                              letterSpacing: 0.1,
                              fontSize: 16,
                              color: Colors.grey.shade400,
                              fontFamily: 'ProximaNovaThin',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          notify.isHeartPressed.value =
                              notify.isHeartPressed.value ? false : true;
                        },
                        icon: Obx(() => (notify.isHeartPressed.value)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24,
                              )
                            : Icon(
                                LineIcons.heart,
                                color: Colors.white,
                                size: 24,
                              ))),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTickMarkColor: Colors.white,
                          inactiveTickMarkColor: Colors.grey.shade600,
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 5),
                          trackHeight: 3),
                      child: Slider(
                        value: (_position.inSeconds.toDouble() !=
                                _duration.inSeconds.toDouble())
                            ? _position.inSeconds.toDouble()
                            : setChanged(),
                        onChanged: (value) {
                          setState(() {
                            seekToSecond(value.toInt());
                            value = value;
                          });
                        },
                        max: _duration.inSeconds.toDouble(),
                        min: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'ProximaNovaThin',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'ProximaNovaThin',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      LineIcons.random,
                      color: Colors.grey.shade400,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Center(
                        child: IconButton(
                            iconSize: 70,
                            alignment: Alignment.center,
                            onPressed: () {
                              notify.isIconPlay.value =
                                  notify.isIconPlay.value ? false : true;

                              if (notify.isIconPlay.value) {
                                advancedplayer.play(UrlSource(widget.audioURL));
                                print(
                                    '${widget.audioURL}//////////////////////////');

                                print(
                                    '${widget.name}//////////////////////////');
                              } else {
                                advancedplayer.pause();
                              }
                              AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                    id: 123,
                                    channelKey: 'spotify',
                                    title: 'Now Playing -${widget.name}',
                                    autoDismissible: false,
                                    displayOnBackground: true,
                                  ),
                                  actionButtons: [
                                    NotificationActionButton(
                                      key: 'play',
                                      label: 'play',
                                      autoDismissible: false,
                                      showInCompactView: true,
                                      actionType: ActionType.KeepOnTop,
                                    ),
                                    NotificationActionButton(
                                        key: 'pause',
                                        label: 'pause',
                                        autoDismissible: false,
                                        showInCompactView: true,
                                        actionType: ActionType.KeepOnTop),
                                    NotificationActionButton(
                                      key: 'stop',
                                      label: 'stop',
                                      autoDismissible: false,
                                      showInCompactView: true,
                                      actionType: ActionType.KeepOnTop,
                                    )
                                  ]);

                              (String? payload) async {
                                if (payload != null) {
                                  if (payload == 'play') {
                                    advancedplayer
                                        .play(UrlSource(widget.audioURL));
                                    notify.setIconPlay(true);
                                    // Handle play action
                                    print('Play button tapped!');
                                    // Add your play logic here
                                  } else if (payload == 'pause') {
                                    advancedplayer.pause();
                                    notify.setIconPlay(false);
                                    // Handle pause action
                                    print('Pause button tapped!');
                                    // Add your pause logic here
                                  } else if (payload == 'stop') {
                                    advancedplayer.stop();
                                    notify.setIconPlay(false);
                                    // Handle stop action
                                    print('Stop button tapped!');
                                    // Add your stop logic here
                                  }
                                }
                                ;
                              };
                            //   final myStream = AwesomeNotifications()
                                  
                            //       .asBroadcastStream();

                            //   myStream.listen((action) {
                            //     if (action.buttonKeyPressed == 'play') {
                            //       advancedplayer
                            //           .play(UrlSource(widget.audioURL));
                            //       notify.setIconPlay(true);
                            //     } else if (action.buttonKeyPressed == 'pause') {
                            //       advancedplayer.pause();
                            //       notify.setIconPlay(false);
                            //     } else if (action.buttonKeyPressed == 'stop') {
                            //       advancedplayer.stop();
                            //       notify.setIconPlay(false);
                            //     }
                            //   });
                            },
                            icon: Obx(() => (notify.isIconPlay.value)
                                ? Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                  ))),
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Icon(
                      Icons.repeat,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  children: [
                    Icon(
                      Icons.speaker_group_outlined,
                      color: Colors.grey.shade400,
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Share.share("https://spotify/songid-32919109");
                      },
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.line_weight_sharp,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
