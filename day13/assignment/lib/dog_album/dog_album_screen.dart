import 'package:flutter/material.dart';

class DogAlbumScreen extends StatelessWidget {
  const DogAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, index) {
          return Container();
        },
      ),
    );
  }
}
