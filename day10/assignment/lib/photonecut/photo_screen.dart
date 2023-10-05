import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('포토네컷'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectedCut(),
          SelectedCut(),
          SelectedCut(),
          SelectedCut(),
        ],
      ),
    );
  }
}

class SelectedCut extends StatefulWidget {
  const SelectedCut({
    super.key,
  });

  @override
  State<SelectedCut> createState() => _SelectedCutState();
}

class _SelectedCutState extends State<SelectedCut> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GestureDetector(
          onDoubleTap: () {
            imagePath = null;
            setState(() {});
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: EdgeInsets.zero,
            ),
            onPressed: () async {
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              imagePath = image?.path;
              setState(() {});
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
              child: imagePath == null
                  ? null
                  : Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
