import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const CustomSearchBar({
    required this.controller,
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          InkWell(

              onTap: onSearch,

              child: Icon(Icons.search,size: 30,color: Colors.white,)),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration.collapsed(
                hintText: 'Search...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.clear,color: Colors.white,size: 25,),
            onPressed: () {
              controller.clear();

            },
          ),
        ],
      ),
    );
  }
}
