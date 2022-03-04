import 'package:get_it/get_it.dart';
import 'package:teste/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:teste/app/domin/interfaces/contact_dao.dart';
import 'package:teste/app/domin/service/contact_service.dart';



 
setupinjection(){
GetIt getit = GetIt.I;

getit.registerSingleton<ContactDAO>(ContactDaoImpl());
getit.registerSingleton<ContactService>(ContactService());


}