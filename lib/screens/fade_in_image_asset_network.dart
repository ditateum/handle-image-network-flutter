import 'package:flutter/material.dart';

class FadeInImageAssetNetwork extends StatelessWidget {
  const FadeInImageAssetNetwork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/block.gif',
          image: 'https://picsum.photos/300/300',

          /// FadeInDuration -> animasi ketika gambar dari network ditampilkan
          fadeInDuration: const Duration(seconds: 5),

          /// FadeOutDuration --> animasi ketika gambar dari placeholder mau selesai
          fadeOutDuration: const Duration(seconds: 10),
        ),
      ),
    );
  }
}
