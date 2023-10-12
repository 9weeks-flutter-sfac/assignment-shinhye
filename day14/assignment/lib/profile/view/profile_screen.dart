import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  final int index;

  const ProfileScreen({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(users[index].name),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(
                        'https://xsgames.co/randomusers/assets/avatars/male/${users[index].id}.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 8,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1000),
                      child: renderName(),
                    ),
                    FadeIn(
                      delay: Duration(milliseconds: 1000),
                      duration: Duration(milliseconds: 1000),
                      child: renderInformation(),
                    ),
                    FadeIn(
                      delay: Duration(milliseconds: 2000),
                      duration: Duration(milliseconds: 1000),
                      child: renderCompany(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 -
                MediaQuery.of(context).size.width / 8,
            left: MediaQuery.of(context).size.width / 20,
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: NetworkImage(
                      'https://xsgames.co/randomusers/assets/avatars/male/${users[index].id}.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderCompany() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Company',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('${users[index].company.name}'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('${users[index].company.catchPhrase}'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('${users[index].company.bs}'),
        ),
      ],
    );
  }

  Widget renderInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Inforamtion',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Icon(Icons.mail),
              SizedBox(width: 8),
              Text('${users[index].email}'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('${users[index].phone}'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Text('${users[index].address}'),
            ],
          ),
        ),
        Divider(height: 32),
      ],
    );
  }

  Widget renderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          users[index].name,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 32,
          ),
        ),
        Divider(height: 32),
      ],
    );
  }
}
