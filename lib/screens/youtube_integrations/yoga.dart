import 'package:fitnessapp/screens/youtube_integrations/play_video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Yoga extends StatefulWidget {
  const Yoga({super.key});

  @override
  State<Yoga> createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  final String name = 'yoga';
  String brief =
      'The practice of yoga can help promote reproductive wellness in women and maintain optimal health during their periods, during pregnancy, and menopause. Routine practice helps alleviate symptoms associated with fertility cycles – so much so that teachers specializing in prenatal yoga are trained to ease the period of pregnancy that is vital to the growth and development of a healthy baby. Personally, it was yoga that gave me the body that I wanted – not the hundred other things I tried. I find that yoga suits women’s bodies; it helps tone but prevents bulking up. It also helps get rid of pesky blotting, which can give the appearance of weight. Below are five essential asanas that every woman should incorporate into her daily routine.';
  final List yogas = [
    'https://www.youtube.com/watch?v=dF7O6-QabIo', // Yoga for Flexibility
    'https://www.youtube.com/watch?v=6kJgTouHHeE', // Full-Body Yoga Flow
    'https://www.youtube.com/watch?v=hJbRpHZr_d0', // Yoga for Weight Loss
    'https://www.youtube.com/watch?v=kFhG-ZzLNN4', // Beginner Yoga for Relaxation
    'https://www.youtube.com/watch?v=8TuRYV71Rgo', // 15-Minute Morning Yoga Routine
    'https://www.youtube.com/watch?v=0eCNnxg4YgI', // Yoga for Back Pain
    'https://www.youtube.com/watch?v=5vKrUV0KxIM',
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
            itemCount: yogas.length,
            itemBuilder: (context, index) {
              final videoId = YoutubePlayer.convertUrlToId(yogas[index]);
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlayVideo(
                            name: name,
                            videoId: videoId,
                            description: brief,
                          )));
                },
                child: SizedBox(
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
