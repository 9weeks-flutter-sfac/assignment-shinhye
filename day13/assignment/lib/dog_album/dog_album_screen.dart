import 'package:assignment/dog_album/model/dog_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DogAlbumScreen extends StatefulWidget {
  const DogAlbumScreen({super.key});

  @override
  State<DogAlbumScreen> createState() => _DogAlbumScreenState();
}

class _DogAlbumScreenState extends State<DogAlbumScreen> {
  Future<DogModel> fetchDogData() async {
    final resp = await Dio().request('https://dog.ceo/api/breeds/image/random');
    return DogModel.fromJson(json: resp.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, index) {
          return FutureBuilder(
            future: fetchDogData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container();
              }
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      content: Image.network(snapshot.data!.message),
                      actions: [
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!.message),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
