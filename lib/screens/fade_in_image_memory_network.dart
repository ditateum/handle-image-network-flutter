import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FadeInImageMemoryNetwork extends StatelessWidget {
  const FadeInImageMemoryNetwork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: FutureBuilder(
          future: rootBundle.loadString('assets/image-base64.txt'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FadeInImage.memoryNetwork(
                placeholder: base64.decode(snapshot.data!),
                image: 'https://picsum.photos/300/300',

                /// FadeInDuration -> animasi ketika gambar dari network ditampilkan
                fadeInDuration: const Duration(seconds: 2),

                /// FadeOutDuration --> animasi ketika gambar dari placeholder mau selesai
                fadeOutDuration: const Duration(seconds: 2),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
