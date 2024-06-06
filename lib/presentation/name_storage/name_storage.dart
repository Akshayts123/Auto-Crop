import 'package:get_storage/get_storage.dart';

class NameStorage {
  static final box = GetStorage();

  static List<String> getNames() {
    return box.read<List<String>>('names') ?? [];
  }

  static void addName(String name) {
    List<String> names = getNames();
    names.add(name);
    box.write('names', names);
  }
}