import 'package:movies_app/data/models/person.dart';
import 'package:movies_app/data/models/person_details.dart';

import '../web_services/persons_web_service.dart';

class PersonsRepository{
  final PersonsWebService personsWebService;

  PersonsRepository(this.personsWebService);

  Future<List<Person>> getPopularPersons() async{
    final persons=await personsWebService.getPopularPersons().catchError((e){throw(e);});
    return persons.map((person) => Person.fromJson(person)).toList();
  }
  Future<PersonDetails> getPerson(int id) async{
    final person =await personsWebService.getPerson(id).catchError((e){throw(e);});
    return PersonDetails.fromJson(person);
  }
}