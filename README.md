# AI Image Generator

A Flutter application that generates AI-powered images from text prompts using the Vyro AI Image Generation API.

## ✨ Features

* Generate images from text prompts
* Clean and responsive Flutter UI
* AI-powered image generation
* Environment variable support using `.env`
* Error handling and loading states

## 🚀 Getting Started

### Prerequisites

* Flutter SDK 3.0+
* Dart SDK
* Vyro AI (ImagineArt)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/Khaleesi-sb/ai_image_generator.git
cd ai_image_generator
```

2. Install dependencies:

```bash
flutter pub get
```

3. Create a `.env` file in the root directory:

```env
AUTH_KEY=your_api_key_here
```

4. Run the application:

```bash
flutter run
```

## 🔧 Configuration

Add your API key to the `.env` file:

```env
VYRO_API_KEY=your_api_key_here
```

Load the environment variables in `main.dart`:

```dart
await dotenv.load(fileName: ".env");
```

## 🏗️ Project Structure

```text
lib/
├── main.dart
├── repo/
│   └── prompt_repo.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   └── ...
└── utils/
    └── ...
```

## 📦 Dependencies

* flutter
* dio
* flutter_dotenv
* path_provider

## 🛠️ Built With

* Flutter
* Dart
* Dio HTTP Client
* Vyro AI Image Generation API

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Shilpa Bhattacharya

GitHub: https://github.com/Khaleesi-sb

---

If you found this project useful, consider giving it a ⭐ on GitHub.
