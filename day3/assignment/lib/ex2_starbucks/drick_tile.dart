import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final String nameKo;
  final String nameEn;
  final String img;
  final String price;

  const DrinkTile({
    required this.nameKo,
    required this.nameEn,
    required this.img,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 48,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameKo,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$nameEn',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '$price원',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
