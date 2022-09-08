import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkedInRow extends StatefulWidget {
  LinkedInRow({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  final FaIcon icon;
  final VoidCallback onTap;
  late bool selected;

  @override
  State<LinkedInRow> createState() => _LinkedInRowState();
}

var isSelected = false;

class _LinkedInRowState extends State<LinkedInRow> {
  void showText() async {
    await Future.delayed(Duration(milliseconds: widget.selected ? 2000 : 30),
        () {
      setState(() {
        isSelected = widget.selected;
      });
      return isSelected;
    });
    await Future.delayed(Duration(seconds: widget.selected ? 2 : 1), () {
      widget.selected ? print('launched') : print('closed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showText();
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: widget.selected ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: widget.selected ? Colors.white : Colors.transparent,
            width: 1,
          ),
        ),
        width: widget.selected ? MediaQuery.of(context).size.width * 0.8 : 52.0,
        // height: widget.selected ? 40.0 : 40.0,
        alignment: widget.selected
            ? Alignment.centerLeft
            : AlignmentDirectional.centerStart,
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: widget.icon,
            ),
            Visibility(
              maintainAnimation: false,
              visible: isSelected,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: TextButton(
                  onPressed: widget.onTap,
                  child: Text('LinkedIn',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
