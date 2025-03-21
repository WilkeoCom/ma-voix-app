import 'dart:async';
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
  bool _isContentVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isContentVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getCloseButton(Color? color) {
    return IconButton(
        icon: const Icon(Icons.close),
        color: color,
        tooltip: "Close",
        onPressed: () => Navigator.pop(context));
  }

  Widget getCloseBar(Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getCloseButton(color)],
      ),
    );
  }

  Widget getCongratsText(Color color) {
    return Text(
      "Merci pour votre vote,\n bravo !",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: color),
      textAlign: TextAlign.center,
    );
  }

  Widget getAnimatedImage() {
    return Lottie.asset(
      "assets/images/clap.json",
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.backgroundColor == Colors.white
        ? Theme.of(context).primaryColor
        : Colors.white;

    return Scaffold(
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
                  child: getCloseBar(color),
                ),
                Visibility(
                  visible: _isContentVisible,
                  child: Expanded(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getCongratsText(color),
                        getAnimatedImage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
