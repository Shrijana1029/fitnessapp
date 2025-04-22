import 'package:fitnessapp/screens/youtube_integrations/play_video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  final String name = 'meditation';
  String brief =
      'The practice of  Meditation can help promote reproductive wellness in women and maintain optimal health during their periods, during pregnancy, and menopause. Routine practice helps alleviate symptoms associated with fertility cycles – so much so that teachers specializing in prenatal  Meditation are trained to ease the period of pregnancy that is vital to the growth and development of a healthy baby. Personally, it was  Meditation that gave me the body that I wanted – not the hundred other things I tried. I find that  Meditation suits women’s bodies; it helps tone but prevents bulking up. It also helps get rid of pesky blotting, which can give the appearance of weight. Below are five essential asanas that every woman should incorporate into her daily routine.';
  final List meditations = [
    // Meditation for Flexibility
    'https://www.youtube.com/watch?v=Hzi3PDz1AWU', // Full-Body Meditation Flow
    'https://www.youtube.com/watch?v=JslvBcIVtDg', // Beginner Meditation for Relaxation
    'https://www.youtube.com/watch?v=GqB5kYFD7bk', // 15-Minute Morning Meditation Routine
    'http://www.youtube.com/watch?v=0eCNnxg4YgI', // Meditation for Back Pain
    'http://www.youtube.com/watch?v=5vKrUV0KxIM', // Meditation Workout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 28),
          )),
        ),
        body: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: meditations.length,
            itemBuilder: (context, index) {
              final videoId = YoutubePlayer.convertUrlToId(meditations[index]);
              final description =
                  "Click  for video ${index + 1}"; // Example descriptions
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlayVideo(
                      name: name,
                      videoId: videoId,
                      description: brief,
                    ),
                  ));
                },
                child: SizedBox(
                  height: 300, // Adjusted height for text space
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              YoutubePlayer.getThumbnail(videoId: videoId!),
                              fit: BoxFit.cover,
                              height: 200,
                              // Fixed height for the video thumbnail
                              width: double.infinity,
                            ),
                            const Positioned(
                              top: 100,
                              left: 100,
                              child: Icon(
                                Icons.play_circle_fill_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
