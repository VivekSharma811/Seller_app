import 'package:flutter/material.dart';
import 'package:seller_app/model/Menu.dart';

class InfoWidget extends StatefulWidget {
  Menu? menu;
  BuildContext? context;

  InfoWidget({Key? key, this.menu, this.context}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 285,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.menu?.thumbnailUrl != null
                    ? widget.menu!.thumbnailUrl!
                    : "",
                height: 210.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1.0,
              ),
              Text(
                widget.menu?.menuTitle != null ? widget.menu!.menuTitle! : "",
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: "TrainOne"),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Text(
                widget.menu?.menuInfo != null ? widget.menu!.menuInfo! : "",
                style: const TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: "TrainOne"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
