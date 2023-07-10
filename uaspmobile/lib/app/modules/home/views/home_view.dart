import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: Obx(() => ListView.builder(
            itemCount: controller.listData.length,
            itemBuilder: (context, int index) {
              var list = controller.listData[index];
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 1),
                child: ListTile(
                  title: Text(list['nama']),
                  subtitle: Text(list['tinggi_meter']),
                ),
              );
            },
          )),
    );
  }
}
