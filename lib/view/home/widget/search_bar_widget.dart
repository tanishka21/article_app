import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskkk/controller/home_controller.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
      margin: EdgeInsets.only(top: 25, left: 20, right: 21),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              autocorrect: false,
              onChanged: (value) {
                controller.search(value);
              },

              cursorColor: Colors.white,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 185, 183, 183),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),

                hintText: 'Search Articles here...',

                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Container(
                  padding: EdgeInsets.all(15),
                  // width: 18,
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
