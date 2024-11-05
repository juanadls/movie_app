import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _CastCard();
          }),
    );
  }
}

class _CastCard extends StatelessWidget {
  static const String _asset = "assets/no-image.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage(_asset),
              image: AssetImage(_asset),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "actor.name",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
