import 'package:flutter/material.dart';

class MusicDetailScreen extends StatefulWidget {
  final String title;
  final String img;
  final String artist;

  const MusicDetailScreen({
    required this.title,
    required this.img,
    required this.artist,
    super.key,
  });

  @override
  State<MusicDetailScreen> createState() => _MusicDetailScreenState();
}

class _MusicDetailScreenState extends State<MusicDetailScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: renderAppBar(),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            child: Image.asset(
              widget.img,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.artist,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          PlayButtons(
            onPlayBtnPressed: () {
              isPlaying = !isPlaying;
              setState(() {});

              showMessage('아이콘은 바뀌지만 노래가 재생되지는 않습니다 ㅎㅎ');
            },
            onPrevBtnPressed: () {
              showMessage('이전 곡 재생은 준비중인 기능입니다.');
            },
            onNextBtnPressed: () {
              showMessage('다음 곡 재생은 준비중인 기능입니다.');
            },
            isPlaying: isPlaying,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      title: Text(widget.title),
      centerTitle: false,
    );
  }

  showMessage(String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }
}

class PlayButtons extends StatelessWidget {
  final VoidCallback onPlayBtnPressed;
  final VoidCallback onPrevBtnPressed;
  final VoidCallback onNextBtnPressed;
  final bool isPlaying;

  const PlayButtons({
    required this.onPlayBtnPressed,
    required this.onPrevBtnPressed,
    required this.onNextBtnPressed,
    required this.isPlaying,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPrevBtnPressed,
          icon: const Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 24),
        IconButton(
          onPressed: onPlayBtnPressed,
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 24),
        IconButton(
          onPressed: onNextBtnPressed,
          icon: const Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
