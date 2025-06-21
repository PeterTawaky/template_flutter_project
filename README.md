# template_project

## Folder Structure

### Core Folders:

```
└── 📁assets
    └── 📁animations
        └── no-internet.json
    └── 📁fonts
    └── 📁icons
    └── 📁images
        └── 404_placeholder.png
        └── shy.png
    └── 📁sounds
    ├── videos
```
___
```
└── 📁lib
    └── 📁app
        └── my_app.dart
    └── 📁core
        └── 📁constants
            └── app_assets.dart
            └── app_colors.dart
            └── app_dimensions.dart
            └── app_enums.dart
            └── app_fonts.dart
            └── app_strings.dart
            └── app_text_styles.dart
            └── app_transition_duration.dart
        └── 📁dependencies
            └── service_locator.dart
        └── 📁errors
            └── error_view.dart
            └── unknown_route_view.dart
        └── 📁models
        └── 📁observer
            └── my_bloc_observer.dart
        └── 📁routes
            └── app_routes.dart
            └── router_generator.dart
        └── 📁services
            └── 📁api
                └── api_constants.dart
                └── api_consumer.dart
                └── api_error_factory.dart
                └── api_error_handler.dart
                └── api_error_model.dart
                └── dio_consumer.dart
                └── 📁interceptors
                    └── api_interceptor.dart
                    └── notion_interceptor.dart
                └── local_status_codes.dart
            └── 📁cache
                └── cache_helper.dart
                └── cache_keys.dart
                └── sql_db.dart
            └── 📁firebase
        └── 📁utils
            └── app_formatters.dart
            └── app_logger.dart
            └── app_validator.dart
            └── device_utility.dart
            └── 📁extensions
                └── context_extensions.dart
            └── helper_functions.dart
            └── 📁themes
                └── app_themes.dart
        └── 📁widgets
            └── 📁components
                └── bottom_ellipse.dart
                └── logging_widget.dart
                └── no_internet_widget.dart
            └── 📁layout
    └── main.dart
```
___
### Architectures:
#### 1. MVVM:
    2-Layers
```
└── 📁features
    └── 📁home
        └── 📁data
            └── 📁models
            └── 📁repositories
                └── home_repo_impl.dart
                └── home_repo.dart
        └── 📁presentation
            └── 📁managers
            └── 📁views
                └── home_view.dart
                └── 📁widgets
                    └── home_view_body.dart
```
___