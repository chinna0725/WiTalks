import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'LikeIcon.dart';
import 'OptionsScreen.dart';

class ContentScreen extends StatefulWidget {
  final String? src;
  const ContentScreen({super.key, this.src});
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized &&
        widget.src != null
            ? GestureDetector(
          onDoubleTap: () {
            setState(() {
              _liked = !_liked;
            });
          },
          child:
         //  Image.asset(widget.src!,
         //  fit: BoxFit.contain,
         // )
          Chewie(
            controller: _chewieController!,
          ),
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Loading...')
          ],
        ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
         OptionsScreen(image:widget.src!)
      ],
    );
  }
}

//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<ReelsModel> reelsList = [
//     ReelsModel(
//         url:
//         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//         likeCount: 578,
//         commentCount: 200,
//         sendCount: 70,
//         isLiked: true,
//         musicName: "my music name 1",
//         musicImageUrl: "",
//         description:
//         "this is demo descriptioin, adkf alkd adkjhfladhlfkja ajkldhfkahfkj  alkjfhaldjfh  akjdhfa jhkfhadhjfkjhfkjdhfd dfd",
//         createdAt: DateTime.now().toString(),
//         updatedAt: DateTime.now().toString(),
//         user: User(
//             userName: "Raman Thakur",
//             profileUrl:
//             "https://img.freepik.com/free-photo/young-indian-man-dressed-trendy-outfit-monitoring-information-from-social-networks_231208-2766.jpg",
//             createdAt: DateTime.now().toString(),
//             updatedAt: DateTime.now().toString(),
//             isFollow: true),
//         reelComments: [
//           ReelComments(
//               cmment: "akkdfhkaljhflkajdf",
//               createdAt: DateTime.now().toString(),
//               updatedAt: DateTime.now().toString(),
//               user: User(
//                 userName: "Vanit Dev",
//                 profileUrl:
//                 "https://img.freepik.com/free-photo/young-indian-man-dressed-trendy-outfit-monitoring-information-from-social-networks_231208-2766.jpg",
//                 createdAt: DateTime.now().toString(),
//                 updatedAt: DateTime.now().toString(),
//               ))
//         ]),
//     ReelsModel(
//       url:
//       "https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4",
//       likeCount: 578,
//       commentCount: 43,
//       sendCount: 80,
//       isLiked: false,
//       musicName: "my music name 1",
//       musicImageUrl: "",
//       description:
//       "this is demo descriptioin, adkf alkd adkjhfladhlfkja ajkldhfkahfkj  alkjfhaldjfh  akjdhfa jhkfhadhjfkjhfkjdhfd dfd",
//       createdAt: DateTime.now().toString(),
//       updatedAt: DateTime.now().toString(),
//       user: User(
//           userName: "Pankaj Thakur",
//           profileUrl:
//           "https://img.freepik.com/free-photo/young-indian-man-dressed-trendy-outfit-monitoring-information-from-social-networks_231208-2766.jpg",
//           createdAt: DateTime.now().toString(),
//           updatedAt: DateTime.now().toString(),
//           isFollow: false),
//     ),
//     ReelsModel(
//         url:
//         "https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-woman-in-a-pool-1259-small.mp4",
//         likeCount: 578,
//         commentCount: 30,
//         sendCount: 7,
//         isLiked: true,
//         musicName: "",
//         musicImageUrl: "",
//         description: "",
//         createdAt: DateTime.now().toString(),
//         updatedAt: DateTime.now().toString(),
//         reelComments: []),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InstaReelsViewer(
//         reelList: reelsList,
//         onClickCommentIcon: (reelData) {},
//         onClickShareIcon: (reelData) {},
//         onLike: (reelData) {},
//         onUnLike: (reelData) {},
//         onClickName: (reelData) {},
//         onFollow: (reelData) {},
//         onUnFollow: (reelData) {},
//       ),
//     );
//   }
// }