import 'package:flutter/material.dart';
import 'package:show_network_image/screens/image_with_cache_network_image.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ImageWithCachedNetworkImage(),
    );
  }
}
