import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  final String img;
  final String title;
  final String artist;
  final String duration;
  final bool isPlaying;

  const MusicTile({
    required this.img,
    required this.title,
    required this.artist,
    required this.duration,
    this.isPlaying = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  img,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                      height: 5,
                    ),
                    Row(
                      children: [
                        if (!isPlaying)
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(
                              CupertinoIcons.check_mark_circled_solid,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        Flexible(
                          // constraints: BoxConstraints(maxWidth: 200),
                          child: Text(
                            artist,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        if (!isPlaying)
                          const Text(
                            ' · ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        if (!isPlaying)
                          Text(
                            duration,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isPlaying)
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  color: Colors.white,
                ),
              if (isPlaying)
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_next),
                      color: Colors.white,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
