import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/consts/text_style.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../consts/colors.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: QueryArtworkWidget(
                id: data.id,
                type: ArtworkType.AUDIO,
                artworkHeight: double.infinity,
                artworkWidth: double.infinity,
                nullArtworkWidget:
                    const Icon(Icons.music_note, size: 48, color: whiteColor),
              ),
            )),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(children: [
                  Text(
                    data.displayNameWOExt,
                    style: ourStyle(
                      color: bgDarkColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    data.artist.toString(),
                    style: ourStyle(
                      color: bgDarkColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "00:00",
                        style: ourStyle(
                          color: bgDarkColor,
                        ),
                      ),
                      Expanded(
                          child: Slider(
                              thumbColor: sliderColor,
                              activeColor: sliderColor,
                              inactiveColor: bgColor,
                              value: 0.0,
                              onChanged: (newValue) {})),
                      Text(
                        "04:00",
                        style: ourStyle(
                          color: bgDarkColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                          color: bgDarkColor,
                        ),
                      ),
                      Obx(
                        () => CircleAvatar(
                          radius: 35,
                          backgroundColor: bgColor,
                          child: Transform.scale(
                            scale: 2.5,
                            child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? Icon(
                                        Icons.pause,
                                        color: whiteColor,
                                      )
                                    : Icon(
                                        Icons.play_arrow_rounded,
                                        color: whiteColor,
                                      )),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_rounded,
                            size: 40,
                            color: bgDarkColor,
                          )),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
