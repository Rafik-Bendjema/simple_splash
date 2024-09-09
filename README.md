# Flutter Splash Screen

A customizable and animated splash screen for your Flutter apps. This package offers smooth fading and scaling effects with support for custom text, logo, gradients, and colors.

## Features:
- Fade and scale animation for smooth splash screen transitions.
- Customizable logo, text, background color, and gradient options.
- Control the duration of animations and add custom logic during the splash screen loading.
- Hooks for tasks while waiting and when the splash screen finishes.

## Installation:

Add `flutter_Simple_splash` to your `pubspec.yaml` dependencies:

'''yaml

dependencies:
  flutter_Simple_splash: ^0.0.1
  
'''

## Usage:

'''dart

    import 'package:flutter_Simple_splash/flutter_Simple_splash.dart';
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            body: Simple_splash(
              backgroundColor: Colors.blueAccent,
              duration: Duration(seconds: 2),
              logo: Image.asset('assets/logo.png'),
              text: 'Welcome to MyApp',
              textSize: 30,
              textColor: Colors.white,
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              whileWaiting: () async {
                // Simulate a task like fetching data
                await Future.delayed(Duration(seconds: 2));
              },
              onFinished: () async {
                // Navigate to the next page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => NextPage()),
                );
              },
            ),
          ),
        );
      }
    }
    
'''

## Parameters:
* backgroundColor: Color of the splash screen background.
* textColor: Color of the text displayed on the splash screen.
* duration: Duration for fade and scale animations.
* whileWaiting: A function to run while waiting on the splash screen.
* onFinished: A function that runs after the splash screen finishes.
* logo: An image widget to display as the logo.
* text: A string to display as the main text.
* gradient: Background gradient (optional).
* textSize: The size of the text displayed.



