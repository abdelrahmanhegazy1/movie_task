import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movie_task/app/data/models/popular_people_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorageService extends GetxService {
  static late Box<PopularPeople> _personBox;
  @override
  void onInit()async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
   Hive.init(appDocumentDir.path);
   Hive.registerAdapter<PopularPeople>(PopularPeopleAdapter()); // Replace with the actual adapter name
   Hive.registerAdapter<KnownFor>(KnownForAdapter()); // Replace with the actual adapter name
  _personBox =await Hive.openBox('popularPeople');
    super.onInit();
  }
  Future<void> addPopularPeople(PopularPeople person) async {
    await _personBox.add(person);
  }

  Future<List<PopularPeople>> getPopularPeopleList() async{
    _personBox =await Hive.openBox('popularPeople');
    return _personBox.values.toList();
  }
  void writeData(
    String boxName,
    String key,
    dynamic data,
  ) async {
    var box = Hive.box(boxName);
    await box.put(key, data);
  }

  void clearAllBoxData({required String boxName}) async {
    await Hive.box(boxName).clear();
  }

  int getBoxSize({required String boxName}) {
    return Hive.box(boxName).values.length;
  }

  List getBoxData({required String boxName}) {
    return Hive.box(boxName).values.toList();
  }

  void deleteRecord({required String boxName, required key}) async {
    await Hive.box(boxName).delete(key);
  }

  dynamic getRecord({required String boxName, required key}) async {
    return await Hive.box(boxName).get(key);
  }
}