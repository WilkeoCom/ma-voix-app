import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ma_voix_app/design_system/widgets/box_widget.dart';

class ConfirmationView extends StatefulWidget {
  final String uniqueKey;
  final Color backgroundColor;

  const ConfirmationView(
      {super.key, required this.uniqueKey, required this.backgroundColor});

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getCloseButton() {
    return IconButton(
        icon: const Icon(Icons.close),
        color: Colors.white,
        tooltip: "Close",
        onPressed: () => Navigator.pop(context));
  }

  Widget getCloseBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getCloseButton()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        actions: [CloseButton()],
      ),*/
      backgroundColor: Colors.transparent,
      body: Center(
        child: Hero(
          tag: widget.uniqueKey,
          createRectTween: (Rect? begin, Rect? end) {
            return MaterialRectCenterArcTween(begin: begin, end: end);
          },
          child: BoxWidget(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            color: widget.backgroundColor,
            child: Column(
              children: [
                Flexible(
                  child: getCloseBar(),
                ),
                Expanded(
                  flex: 2,
                  child: Lottie.asset(
                    "assets/images/check.json",
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
              ],
            ),
            /*
            child: Lottie.asset(
              "assets/images/check.json",
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
            */
          ),
        ),
      ),
    );
  }
}
