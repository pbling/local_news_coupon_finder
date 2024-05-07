import 'package:flutter/material.dart';

class PhotoSlideView extends StatelessWidget {
  final String imageUrl;

  const PhotoSlideView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}