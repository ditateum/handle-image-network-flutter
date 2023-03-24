import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageWithCachedNetworkImage extends StatelessWidget {
  const ImageWithCachedNetworkImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: CachedNetworkImage(
          /// Digunakan untuk mengatur durasi penyimpan image di cache
          /// Karena semakin banyak cache, akan menyebabkan semakin memory hp semakin membengkak
          cacheManager: CacheManager(
            Config(
              "cache-key-name",
              stalePeriod: const Duration(seconds: 3),
            ),
          ),
          imageUrl: 'https://picsum.photos/300/300',

          /// Jika ingin menampilkan placeholder dari asset atau memory
          // placeholder: (context, url) => Image.asset('assets/block.gif'),
          // placeholderFadeInDuration: const Duration(seconds: 2),

          /// Jika ingin menampilkan progress indicator daripada placeholder
          progressIndicatorBuilder: (context, url, progress) =>
              CircularProgressIndicator(
            value: progress.progress,
          ),

          /// Apabila imageUrl nya tidak dapat diakses, maka bisa mencustom errorWidget
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
