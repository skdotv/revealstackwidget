<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

    Reveal Animated Pages



![reveal_effect](https://user-images.githubusercontent.com/40072637/150992649-498d8f9b-399c-416f-b57d-ed2bd140f452.gif)



## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
RevealStackWidget(
  verticalSpacing: 100,
  children: [
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Text(
          "1",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
       Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Text(
          "2",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
   ],
  )
                  )

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
