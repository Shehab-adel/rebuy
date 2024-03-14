import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/utils/app_export.dart';
import 'package:rebuy/presentation/explore_page/cubit/states.dart';

class ExploreCubit extends Cubit<ExploreSate> {
  ExploreCubit() : super(ExploreInitState());

  static ExploreCubit get(context) => BlocProvider.of(context);

  Map<String, String> manFashionMap = {
    'Office Bage': AppImageConstants.imgBagIcon,
    'Shirt': AppImageConstants.imgManTShirtIcon,
    'T-Shirt': AppImageConstants.imgManTShirtIcon,
    'Shoes': AppImageConstants.imgManShoesIcon,
    'Pants': AppImageConstants.imgManPantsIcon,
    'Underweare': AppImageConstants.imgManUnderwearIcon,
  };

  Map<String, String> womenFashionMap = {
    'Shirt': AppImageConstants.imgManTShirtIcon,
    'Dress': AppImageConstants.imgDressIcon,
    'Pants': AppImageConstants.imgWomanPantsIcon,
    'Skirt': AppImageConstants.imgSkirtIcon,
    'Bag': AppImageConstants.imgWomanBagIcon,
    'Heels': AppImageConstants.imgHighHeelsIcon,
    'Bikini': AppImageConstants.imgBikiniIcon,
  };
}
