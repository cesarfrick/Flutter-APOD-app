# APOD Gallery

A Flutter application that implements NASA Astronomy Picture of the Day API.
This application is part of my journey into Flutter development, so it shouldn't be taken as a fully, well terminated app, and more like part of a learning process.

## Getting Started

If you don't have Flutter set up in your machine, the Flutter docs page has information about [how to install Flutter](https://docs.flutter.dev/get-started/install) and [how to configure your editor](https://docs.flutter.dev/get-started/editor)

Once you have all set up, and cloned your project, you'll still need to request an API Key to access the Astronomy Picture of the Day API, and can be obtained for free in the [NASA APIs website](https://api.nasa.gov/)

Then, navigate to the `lib` folder, and create an `auth` folder, inside that folder, create a file called `secrets.dart`, and inside the file add this:

```dart
const apiKey = 'YOUR_NASA_API';
```

Next, install the project dependencies by running `flutter pub get` in your terminal (you need to be in the project root directory)

To run the project, you can run `flutter run` in your terminal or -if your editor allows it- you can run it directly from the editor.

Remember to first open your Android Emulator or your IOS Simulator and select it as target.

The first load is going to take some time, so be patient, after that, you can hot reload or hot restart from the editor or the terminal.

This project uses Flutter version 2.8.1 and can be managed using [Flutter Version Manager (fvm)](https://fvm.app/), but it's not a requirement, although it's recommended.

### Some Resources to learn Flutter

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Feel free to fork this project and use it as you see fit, send issues or pull requests to help to improve it, although this has been created as a learning project, not a production one.
