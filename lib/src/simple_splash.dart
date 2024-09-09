import 'package:flutter/material.dart';

class Simple_splash extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;
  final Future<void> Function()? whileWaiting;
  final Future<void> Function()? onFinished;
  final Image? logo;
  final String? text;
  final LinearGradient? gradient;
  final double textSize;

  const Simple_splash(
      {super.key,
      this.backgroundColor = Colors.grey,
      this.duration = const Duration(seconds: 1),
      this.logo,
      this.gradient,
      this.onFinished,
      this.text,
      this.textSize = 25,
      this.textColor = Colors.white,
      this.whileWaiting});

  @override
  State<Simple_splash> createState() => _Simple_splashState();
}

class _Simple_splashState extends State<Simple_splash> {
  double _opacity = 0;
  double height = 0;
  @override
  void initState() {
    if (widget.text == null && widget.logo == null) {
      throw "both text and logo is null";
    }

    fading();
    super.initState();
  }

  void fading() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _opacity = 1;
      height = 1;
    });

    // Await the whileWaiting function if it exists
    if (widget.whileWaiting != null) {
      await widget.whileWaiting!();
    }

    // Await the onFinished function if it exists
    if (widget.onFinished != null) {
      await widget.onFinished!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.gradient != null ? widget.backgroundColor : null,
          gradient: widget.gradient),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: widget.duration,
        child: AnimatedScale(
          duration: widget.duration,
          scale: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.logo ??
                  const SizedBox(
                    height: 0,
                  ),
              const SizedBox(
                height: 20,
              ),
              widget.text != null
                  ? Text(
                      widget.text!,
                      style: TextStyle(
                          fontSize: widget.textSize,
                          color: widget.textColor,
                          fontWeight: FontWeight.bold),
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
