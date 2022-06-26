import 'package:accelerator_lesson5/database/characters_model.dart';

class CharactersDatabase {
    final List list = [
      CharactersModel(
          name: 'Рик Санчез', gender: 'Мужской', race: 'Человек', life: 'Живой'),
      CharactersModel(
          name: 'Алан Райс', gender: 'Мужской', race: 'Человек', life: 'Мертвый'),
      CharactersModel(
          name: 'Морти Смит', gender: 'Мужской', race: 'Человек', life: 'Живой'),
      CharactersModel(
          name: 'Саммер Смит', gender: 'Женский', race: 'Человек', life: 'Живой'),
    ];
}
