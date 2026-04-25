# SmoothSnackBar

A beautiful, animated, and highly customizable overlay snackbar for Flutter.

SmoothSnackBar allows you to display elegant notification messages from the top or bottom of the screen with smooth animations, swipe-to-dismiss gestures, and flexible customization options.

---

## ✨ Features

* 🚀 Smooth slide animation (top & bottom)
* 👆 Tap to dismiss with callback
* 🧲 Swipe down to dismiss
* 🔒 Optional non-dismissible mode
* 🎯 Custom action button support
* 🧩 Custom title widget support
* ⚡ Lightweight and easy to use
* 🎨 Built with Flutter Material & Cupertino icons

---

## 📸 Preview

![SmoothSnackBar demo](files/demo.gif)

---

## 🚀 Getting Started

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  smooth_snack_bar: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🧪 Basic Usage

```dart
SmoothSnackBar.show(
  context,
  title: "Hello from SmoothSnackBar",
);
```

---

## 📍 Show from Top

```dart
SmoothSnackBar.show(
  context,
  title: "Notification from top",
  fromTop: true,
);
```

---

## ⚠️ Snackbar Types

```dart
SmoothSnackBar.show(
  context,
  title: "Success message",
  icon: SnackBarType.success,
);

SmoothSnackBar.show(
  context,
  title: "Warning message",
  icon: SnackBarType.warning,
);

SmoothSnackBar.show(
  context,
  title: "Danger message",
  icon: SnackBarType.danger,
);
```

---

## 🎯 With Action Button

```dart
SmoothSnackBar.show(
  context,
  title: "Item deleted",
  button: MessageButton(
    title: "Undo",
    function: () {
      print("Undo clicked");
    },
  ),
);
```

---

## 🧩 Custom Title Widget

```dart
SmoothSnackBar.show(
  context,
  title: "",
  onTitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("Custom Title", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("More details here"),
    ],
  ),
);
```

---

## ⏱ Duration

```dart
SmoothSnackBar.show(
  context,
  title: "Long duration",
  duration: Duration(seconds: 10),
);
```

---

## 🔒 Disable Swipe Dismiss

```dart
SmoothSnackBar.show(
  context,
  title: "Cannot be dismissed",
  isDismissible: false,
);
```

---

## 👆 Tap Action

```dart
SmoothSnackBar.show(
  context,
  title: "Tap me",
  onTap: () {
    print("Snackbar tapped");
  },
);
```

---

## ⚙️ Parameters

| Parameter       | Type                 | Description                        |
| --------------- |----------------------| ---------------------------------- |
| `title`         | String               | Main message text                  |
| `onTitle`       | Widget?              | Custom title widget                |
| `isDanger`      | bool?                | Applies the danger rotation option |
| `button`        | MessageButton?       | Action button                      |
| `duration`      | Duration?            | Display duration                   |
| `icon`          | SnackBarType?        | Icon type (success, warning, info, danger) |
| `isDismissible` | bool                 | Enable swipe dismiss               |
| `fromTop`       | bool                 | Show from top                      |
| `onTap`         | VoidCallback?        | Tap callback                       |

---

## 📱 Example App

Check `lib/example/example.dart` for a complete demo.

This demo includes:

* Position variations
* Different message types
* Action buttons
* Custom widgets

---

## 🧠 Notes

* Requires a valid `BuildContext` with a Navigator
* Uses `Overlay` for rendering
* Designed for performance and smooth UX

---

## ❤️ Contributing

Feel free to open issues or submit pull requests.

---

## 📄 License

MIT License
