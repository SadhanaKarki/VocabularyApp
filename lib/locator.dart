//dependency injection part
import 'package:get_it/get_it.dart';
import 'package:vocabulary_app/database/app_db.dart';
GetIt locator = GetIt.instance;

void setUp(){
  locator.registerLazySingleton(()=>AppDb()); //we can access appdb class , registering it instantiates only when needed , makes sure no more than single instance during app life cycle
}
