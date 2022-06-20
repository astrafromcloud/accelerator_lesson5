import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../database/characters_database.dart';
import '../../../database/characters_model.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharactersDatabase charactersDatabase = CharactersDatabase();
    return GridView.builder(
        itemCount: 20,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            mainAxisSpacing: 24

        ),
        itemBuilder: (builder, index) {
          CharactersModel item = charactersDatabase.list[index % 4];
          return Column(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(AppAssets.images.noAvatar),
                ),
              ),
              const SizedBox(height: 18,),
              Text(item.life.toUpperCase(), style: AppStyles.s10w500.copyWith(color: item.life == 'Живой' ? AppColors.green : AppColors.red, letterSpacing: 1.5),),
              Text(item.name, style: AppStyles.s14w500,),
              Text('${item.race}, ${item.gender}', style: AppStyles.s12w400.copyWith(color: AppColors.grey),),
            ],
          );
        }
    );

  }
}



