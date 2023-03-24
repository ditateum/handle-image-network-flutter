Belajar Menampilkan Image Network di Flutter
==
Ini adalah catatan hasil belajar dan explorasi saya tentang cara menghandle atau menampilkan Image Network di Flutter.
--

1. Menggunakan Widget `FadeInImage.assetNetwork`
```
FadeInImage.assetNetwork(

    /// placoholder ini digunakan untuk menampilkan image dari asset sambil menunggu image network selesai progressnya. Image assetnya bisa gif, jpeg, png

    placeholder: 'assets/block.gif',
    image: 'https://picsum.photos/300/300',

    /// FadeInDuration -> animasi ketika gambar dari network ditampilkan
    fadeInDuration: const Duration(seconds: 5),

    /// FadeOutDuration --> animasi ketika gambar dari placeholder mau selesai
    fadeOutDuration: const Duration(seconds: 10),
),
```

2. Menggunakan Widget `FadeInImage.memoryNetwork`
Sama seperti .assetNetwork, hanya yang membedakan image placeholdernya diambil dari memory (berupa base64 String)
```
FutureBuilder(
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
```

3. Menggunakan Widget dari Package `CachedNetworkImage`
Disini ada tambahan package yaitu `flutter_cache_manager` untuk menghandle cache nya

```
CachedNetworkImage(
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
```
Sebagai catatan mungkin saat simulasi errorWidget, bukannya menampilkan icon error seperti yang dimau, tapi malah app nya berhenti. Tidak perlu kuatir, hal tersebut sudah di jelaskan di dokumentasinya di bagian [FAQ](https://github.com/Baseflow/flutter_cached_network_image#my-app-crashes-when-the-image-loading-failed-i-know-this-is-not-really-a-question)
