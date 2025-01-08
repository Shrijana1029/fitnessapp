import 'package:fitnessapp/screens/youtube_integrations/play_video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Cardio extends StatefulWidget {
  const Cardio({super.key});

  @override
  State<Cardio> createState() => _CardioState();
}

class _CardioState extends State<Cardio> {
  final String name = 'cardio';
  String brief =
      'The practice of  Cardio can help promote reproductive wellness in women and maintain optimal health during their periods, during pregnancy, and menopause. Routine practice helps alleviate symptoms associated with fertility cycles – so much so that teachers specializing in prenatal  Cardio are trained to ease the period of pregnancy that is vital to the growth and development of a healthy baby. Personally, it was  Cardio that gave me the body that I wanted – not the hundred other things I tried. I find that  Cardio suits women’s bodies; it helps tone but prevents bulking up. It also helps get rid of pesky blotting, which can give the appearance of weight. Below are five essential asanas that every woman should incorporate into her daily routine.';
  final List cardios = [
    // Cardio for Flexibility
    'https://www.youtube.com/watch?v=crPb62o-z_E', // Full-Body Cardio Flow
    'https://www.youtube.com/watch?v=crPb62o-z_E', // Full-Body Cardio Flow
    'https://www.youtube.com/watch?v=crPb62o-z_E', // Full-Body Cardio Flow
    'https://www.youtube.com/watch?v=X3q5e1pV4pc', // Beginner Cardio for Relaxation
    'https://www.youtube.com/watch?v=melA7IB117I', // 15-Minute Morning Cardio Routine
    'http://www.youtube.com/watch?v=0eCNnxg4YgI', // Cardio for Back Pain
    'http://www.youtube.com/watch?v=5vKrUV0KxIM', // Cardio Workout
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
          style: TextStyle(fontSize: 28),
        )),
      ),
      body: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: cardios.length,
            itemBuilder: (context, index) {
              final videoId = YoutubePlayer.convertUrlToId(cardios[index]);
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlayVideo(
                            name: name,
                            videoId: videoId,
                            description: brief,
                          )));
                },
                child: Container(
                    height: 300,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                              YoutubePlayer.getThumbnail(videoId: videoId!),
                              fit: BoxFit.cover),
                          const Positioned(
                            top: 110,
                            left: 110,
                            child: Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          )
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
