import 'dart:io';

import 'package:template_project/core/utils/app_logger.dart';

import 'templates.dart';

Future<void> main() async {
  // Define the Architecture structure
  final structure = {
    //!-------------------------------------
    //!      Data Layer
    //!-------------------------------------
    'lib': ['main.dart'],

    'lib/features/home/data/models': [],
    'lib/features/home/data/repositories': [
      'home_repo.dart',
      'home_repo_impl.dart',
    ],

    //!-------------------------------------
    //!      Presentation Layer
    //!-------------------------------------
    'lib/features/home/presentation/managers': [],
    'lib/features/home/presentation/views/widgets': ['home_view_body.dart'],
    'lib/features/home/presentation/views/': ['home_view.dart'],
  };

  for (var entry in structure.entries) {
    final folder = entry.key;
    final files = entry.value;

    await Directory(folder).create(recursive: true);
    AppLogger.trace('Created folder: $folder');

    for (var file in files) {
      final filePath = '$folder/$file';

      final fileRef = File(filePath);
      if (await fileRef.exists()) {
        AppLogger.trace('Skipped existing file: $filePath');
      } else {
        final content = templates[file] ?? '';
        await fileRef.writeAsString(content);
        AppLogger.trace('Created file: $filePath');
      }
    }
  }

  AppLogger.info('All folders and files created successfully!');
}
