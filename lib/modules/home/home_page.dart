import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(() {
        return ListView.builder(
          controller: controller.scroll,
          itemCount: controller.loading
              ? controller.filmes.length + 1
              : controller.filmes.length,
          itemBuilder: (_, index) {
            if (index == controller.filmes.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    'Carregando!!!',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }

            final filme = controller.filmes[index];

            return ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w500/${filme.poster}'),
              title: Text(filme.title),
            );
          },
        );
      }),
    );
  }
}
