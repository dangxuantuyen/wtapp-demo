import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: SizedBox(
                width: Get.height,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
