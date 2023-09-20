import 'package:assignment/ex3_youtube_music/music_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          const Expanded(
            child: MusicList(),
          ),
          // Current play
          Container(
            color: const Color(0xFF424242),
            child: MusicTile(
              img: 'assets/youtube/music_you_make_me.png',
              title: 'You Make Me',
              artist: 'DAY6',
              duration: '3:00',
              isPlaying: true,
            ),
          ),
          // Current play position
          const CurrentPlayPosition(),
        ],
      ),
      bottomNavigationBar: renderBottomNavigationBar(),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      title: const Text('아워리스트'),
      centerTitle: false,
      leading: const Icon(CupertinoIcons.left_chevron),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.connected_tv),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.search_outlined),
        ),
      ],
    );
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF424242),
      unselectedItemColor: Colors.white54,
      selectedItemColor: Colors.white,
      currentIndex: 2,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '둘러보기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: '보관함',
        ),
      ],
    );
  }
}

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MusicTile(
          img: 'assets/youtube/music_come_with_me.png',
          title: 'Come with me',
          artist: 'Surfaces 및 salem ilese',
          duration: '3:00',
        ),
        MusicTile(
          img: 'assets/youtube/music_good_day.png',
          title: 'Good day',
          artist: 'Surfaces',
          duration: '3:00',
        ),
        MusicTile(
          img: 'assets/youtube/music_honesty.png',
          title: 'Honesty',
          artist: 'Pink Sweat\$',
          duration: '3:09',
        ),
        MusicTile(
          img: 'assets/youtube/music_i_wish_i_missed_my_ex.png',
          title: 'I Wish I Missed My Ex',
          artist: '마할리아 버크마',
          duration: '3:24',
        ),
        MusicTile(
          img: 'assets/youtube/music_plastic_plants.png',
          title: 'Plastic Plants',
          artist: '마할리아 버크마',
          duration: '3:20',
        ),
        MusicTile(
          img: 'assets/youtube/music_sucker_for_you.png',
          title: 'Sucker for you',
          artist: '맷 테리',
          duration: '3:24',
        ),
        MusicTile(
          img: 'assets/youtube/music_summer_is_for_falling_in_love.png',
          title: 'Summer is for falling in love',
          artist: 'Sarah Kang & Eye Love Brandon',
          duration: '3:00',
        ),
        MusicTile(
          img: 'assets/youtube/music_these_days.png',
          title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
          artist: 'Rudimental',
          duration: '3:00',
        ),
        MusicTile(
          img: 'assets/youtube/music_you_make_me.png',
          title: 'You Make Me',
          artist: 'DAY6',
          duration: '3:00',
        ),
        MusicTile(
          img: 'assets/youtube/music_zombie_pop.png',
          title: 'Zombie Pop',
          artist: 'DRP IAN',
          duration: '3:00',
        ),
      ],
    );
  }
}

class CurrentPlayPosition extends StatelessWidget {
  const CurrentPlayPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 1.5,
          color: Colors.white,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
