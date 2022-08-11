import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:page_turn/page_turn.dart';

class MainList extends StatelessWidget {
  MainList({
    Key? key,
    required this.title,
    required this.page,
    required this.pageCont,
  }) : super(key: key);

  final String title;
  final String page;
  final pageCont;

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Color(0xFF323232),
      child: InkWell(
        // splashColor: Colors.white,
        onTap: () async {
          pageCont.currentState.goToPage(int.parse(page));
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(top: 7, bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                    const Text(
                      '  \u2022 ',
                      style: TextStyle(color: Color(0xFFcccccc), fontSize: 32),
                    ),
                    Container(
                      width: 185,
                      child: Text(
                          title,
                        style: TextStyle(color: Color(0xFFcccccc), fontSize: 14),
                      ),
                    ),
                  ]),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color(0xFFcccccc),
                  size: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
