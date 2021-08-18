import 'package:flutter/material.dart';

Widget buildListTile({String? title, String? singer, String? cover, function}) {
  return InkWell(
    onTap: function,
    child: Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(cover!),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                singer!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
