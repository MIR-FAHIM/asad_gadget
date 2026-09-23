# Code Structure Knowledge

This project should be maintained as a GetX-based modular Flutter codebase.

## Core Stack

- Use GetX for state management, dependency injection, bindings, and route management.
- Keep feature code modular under `lib/app/modules`.
- Keep shared app infrastructure under `lib/app/api_providers`, `lib/app/models`, `lib/app/routes`, and `lib/app/services`.

## Main Architecture & Data Flow Rules

Data and control flow MUST follow this exact order:

```text
View -> Controller -> Repository -> APIManager -> API
View <- Controller (stores Model/State) <- Repository (returns decoded JSON) <- APIManager
```

### Critical Layer Responsibilities:

1. **Every Module MUST Have Its Own Repository**:
   - Each feature module under `lib/app/modules/feature_name/` must include its own dedicated repository (e.g., `lib/app/modules/feature_name/repositories/feature_name_repository.dart`).
   - Use app-level repositories under `lib/app/repositories/` only when logic is strictly shared across multiple distinct modules.

2. **Repository Contract**:
   - Repositories MUST ONLY call `APIManager` methods.
   - Repositories MUST ONLY return the raw decoded response (e.g., `Map<String, dynamic>` or `List<dynamic>`) received directly from `APIManager`.
   - Repositories MUST NOT instantiate or parse Dart model objects.

3. **Controller Contract**:
   - Controllers call their feature repository to get the decoded JSON response.
   - Controllers parse/instantiate the model objects from the decoded response (e.g., using `ModelClass.fromJson(...)`).
   - Controllers store and manage model state (e.g. `final user = Rxn<UserModel>()`).
   - Controllers never call `APIManager` directly.

4. **View Contract**:
   - Views present UI and react to controller state (e.g., using `Obx` or `GetView`).
   - Views must never call repositories or `APIManager` directly.

## Root Folder Responsibilities

```text
lib/
  app/
    api_providers/
    models/
    modules/
    repositories/
    routes/
    services/
```

### `api_providers/`

Direct API/network layer.

Expected files:

- `api_manager.dart`: HTTP methods, headers, request body, query params, response parsing, status handling, timeout handling, exception mapping.
- `api_url.dart`: base URL, endpoint paths, API route constants.
- `custom_exceptions.dart` or current project equivalent `customExceptions.dart`: network/API exception classes.

### `models/`

Dart model classes for API responses and request/response payloads.

Rules:

- Use `fromJson` and `toJson` methods.
- Organize by feature/domain when the model list grows.
- Models are instantiated and stored inside Controllers after receiving raw decoded JSON from Repositories.

### `repositories/`

Shared/global repositories only (for logic shared across multiple modules).

Rules:

- Use this folder ONLY when repository logic is shared across multiple modules.
- Return the decoded JSON response directly from `APIManager` to the calling controller.

### `services/`

App-wide services such as:

- Auth/session service
- Local storage service
- Connectivity service
- Notification service
- Firebase messaging service
- Location service
- Theme/settings/translation services

### `routes/`

All GetX navigation belongs here.

Required files:

- `app_pages.dart`: defines `AppPages`, `INITIAL`, and `GetPage` entries.
- `app_routes.dart`: `part of 'app_pages.dart';`, public `Routes` constants, private `_Paths` constants.

Every module route should register:

- route name/path
- page/view
- binding

## Feature Module Structure

Target structure for each feature module:

```text
lib/app/modules/feature_name/
  bindings/
    feature_name_binding.dart
  controllers/
    feature_name_controller.dart
  repositories/
    feature_name_repository.dart
  views/
    feature_name_view.dart
    widgets/
```

## Feature Module Component Roles

- **`bindings/`**: GetX bindings for injecting the feature controller and feature repository.
- **`repositories/`**: Feature-specific repository calling `APIManager` and returning raw decoded JSON responses.
- **`controllers/`**: GetX controller; calls feature repository, receives decoded JSON response, parses and stores model objects, handles UI state & reactive variables.
- **`views/`**: Main screen UI only.
- **`views/widgets/`**: Reusable UI widgets scoped to that feature module.

## Binding Pattern

Bindings use GetX `Bindings` class to handle dependency injection. Standard pattern:

```dart
class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeatureRepository>(() => FeatureRepository());
    Get.lazyPut<FeatureController>(() => FeatureController());
  }
}
```

Rules:

- Extend `Bindings` class.
- Override `dependencies()` method.
- Use `Get.lazyPut()` for lazy initialization.
- Inject repository first, then controller.
- Register binding in `app_pages.dart` for each route.

## Naming Rules

- Folders and files: lowercase `snake_case`.
- Classes: `PascalCase`.
- Controllers: `FeatureNameController`.
- Bindings: `FeatureNameBinding`.
- Repositories: `FeatureNameRepository`.
- Views: `FeatureNameView`.
- Route constants: follow the existing `Routes`/`_Paths` style in `app_routes.dart`.

## Checklist When Creating A New Feature

Always add:

1. Module folder structure (`bindings/`, `controllers/`, `repositories/`, `views/`).
2. `FeatureRepository` returning decoded JSON response from `APIManager`.
3. `FeatureController` calling repository, parsing and saving model state.
4. `FeatureBinding` registering repository and controller.
5. `FeatureView` building the UI.
6. Route entry in `app_pages.dart` & route constant in `app_routes.dart`.
