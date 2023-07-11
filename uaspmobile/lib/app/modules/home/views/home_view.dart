import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Gunung Berapi di Indonesia'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.fetchData(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(136, 255, 255, 255),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.listData.length,
                itemBuilder: (context, index) {
                  var list = controller.listData[index];
                  return Container(
                    color: const Color.fromARGB(62, 255, 255, 255),
                    margin: const EdgeInsets.only(bottom: 1),
                    child: ListTile(
                      title: Text(list['nama']),
                      subtitle: Text(list['tinggi_meter']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
