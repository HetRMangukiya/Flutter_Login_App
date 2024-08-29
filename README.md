# Implement Google Sign-In with Firebase Using GetX in Flutter

This repository demonstrates how to implement Google Sign-In using Firebase and GetX in a Flutter application.

## Features

- **Google Sign-In**: Easily integrate Google authentication into your Flutter app.
- **Firebase Authentication**: Securely manage user authentication with Firebase.
- **GetX State Management**: Simplify state management and dependency injection with GetX.

## Prerequisites

Before running this project, ensure you have the following set up:

- Flutter SDK
- Firebase project
- Google Sign-In credentials

## Getting Started

Follow these steps to get started with the project:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/HetRMangukiya/Flutter_Login_App.git
    cd flutter-google-signin-getx
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Set up Firebase**:

    - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
    - Add an Android/iOS app to your Firebase project and download the `google-services.json` or `GoogleService-Info.plist` file.
    - Place the `google-services.json` file in the `android/app` directory.
    - Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.

4. **Configure the project**:

    - Open `android/app/build.gradle` and add the following line:

      ```gradle
      apply plugin: 'com.google.gms.google-services'
      ```

    - Open `android/build.gradle` and add the classpath:

      ```gradle
      classpath 'com.google.gms:google-services:4.3.10'
      ```

5. **Run the app**:

    ```bash
    flutter run
    ```

## Usage

- **Sign In**: Tap the "Sign In with Google" button to authenticate with your Google account.
- **Sign Out**: Tap the "Sign Out" button to sign out of your Google account.

## Demo

Check out the [YouTube video](https://youtu.be/_pFYZ2GjKkc) for a step-by-step tutorial.

| Sign In Screen | Home Screen |
|----------------|-------------|
| ![Sign In](https://github.com/user-attachments/assets/ca3ad2b8-b65d-4143-9d0e-72251236b4ef) | ![Home](https://github.com/user-attachments/assets/1206d9e8-0043-4145-9dcf-3ff1d0cd4e60) |

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
