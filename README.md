# RenterManager

RenterManager is a Flutter application dedicated to provide a support in the managent process for house rentals. The app concentrates informations both of the houses and the tenants, such as the monthly rent amount, payment day, adresses. 

As backend the applications uses Firebase, which provides services for authentication and data storage. 

## Technologies
 
 - flutter sdk: ">=2.7.0 <3.0.0"
 - google_fonts: ^1.1.0
 - firebase_core: "^0.7.0"
 - firebase_auth: "^0.20.1"
 - provider: ^4.3.2+3

## Getting Started

To see this project running on your machine make sure you have installed Flutter 2 and a device to emulate (Android or iOS) or a Google Chrome based browser.

1. Clone this repository to your machine:

```bash
git clone https://github.com/hereisjohnny2/renter_manager.git
cd ./renter_manager
```

2. Next run pub get command to get the dependencies:

```bash
flutter pub get
```

3. After get all packages, check if your device is connected
```bash
flutter devices 
```

4. You can just use the Flutter run command with no options or select the ID of the device that you want to use

```bash
flutter run
```

or 

```bash
flutter run -d [device-id]
```