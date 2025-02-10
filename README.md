# Flutter Sample Project

This is a sample Flutter project that demonstrates the usage of several important features and practices for building scalable Flutter applications. The project includes the following:

- **State Management with GetX**
- **Localization for Multiple Languages**
- **Theming for Dark, Light, and System Modes**
- **Reusable Components**
- **Navigation and Routing**
- **MVVM Architecture with Repository Pattern**
- **Network Layer and Local Database Storage**

## Features

### 1. **State Management with GetX**
This project uses the [GetX](https://pub.dev/packages/get) state management solution to manage the application’s state efficiently and cleanly.

- **Easy state management** with reactive variables.
- **Navigation handling** with GetX's navigation methods.
- **Dependency Injection** for easy access to controllers and services.

### 2. **Localization for Multiple Languages**
The app supports multiple languages, and the content is fully localized for:

- **English**
- **Urdu**
- **Arabic**

The localization feature helps switch between languages easily based on user preferences. This is done using Flutter's `intl` package in combination with `GetX` for reactive language switching.

### 3. **Theming: Dark, Light, and System**
The app supports theme switching between:

- **Light Mode**
- **Dark Mode**
- **System Mode** (automatically adjusts based on the system's theme preference)

Theming is applied globally across the app for a consistent and pleasant user experience.

### 4. **Reusable Components**
The project utilizes reusable UI components to ensure clean, maintainable, and consistent design throughout the application.

- **Custom AppBar**
- **Loading Indicators**
- **Text Styles and Buttons**
- **Reusable Widgets for various UI patterns**

### 5. **Navigation and Routing**
The project uses **GetX** for routing and navigation:

- Simple and efficient **navigation management** with named routes.
- **Obx** reactive widget for updating UI when state changes.

### 6. **MVVM Architecture**
The app follows the **Model-View-ViewModel (MVVM)** architecture to separate business logic from UI components.

- **View**: UI layer (Widgets) that shows data.
- **ViewModel**: Responsible for fetching and processing data, communicating with the model and the view.
- **Model**: Data and entities, representing the actual structure of the app's information.

### 7. **Repository Pattern for API & Database Storage**
The project uses a **Repository Pattern** to manage API calls and local storage:

- **Network Layer**: A base repository pattern for calling a single API, handling responses and errors efficiently.
- **Database Storage**: Local data storage with SQLite using the `sqflite` package for caching and offline capabilities.

**API**: Data is fetched from a remote server via a REST API.

**Database**: The project uses SQLite for storing and retrieving data locally.

### 8. **Dependencies**
Here are some of the dependencies used in this project:

- `get`: State management and routing.
- `intl`: For localization and internationalization.
- `sqflite`: For local database storage.
- `flutter_localizations`: Flutter’s built-in localization library.
- `get_storage`: Local storage for caching data.

For a complete list of dependencies, check the `pubspec.yaml` file.

## Setup

To set up this project locally, follow these steps:

1. **Clone the repository**:

```bash
git clone https://github.com/yourusername/flutter-sample-project.git
