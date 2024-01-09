import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuy/core/app_export.dart';
import 'package:rebuy/presentation/dashboard_page/cubit/states.dart';

class DashCubit extends Cubit<DashSatates> {
  DashCubit() : super(DashInitState());

  static DashCubit get(context) => BlocProvider.of(context);

  int sliderIndex = 0;

  changeAnimatedSmoothIdex(int index) {
    sliderIndex = index;
    emit(ChangeAnimatedSmoothIdex());
  }

  Map<String, String> categoryMap = {
    'Man Shirt': AppImageConstants.imgManTShirtIcon,
    'Office Bag': AppImageConstants.imgBagIcon,
    'Dress': AppImageConstants.imgDressIcon,
    'Woman Bag': AppImageConstants.imgWomanBagIcon,
    'Pants': AppImageConstants.imgWomanPantsIcon,
    'Skirt': AppImageConstants.imgSkirtIcon,
    'Bag': AppImageConstants.imgWomanBagIcon,
    'Heels': AppImageConstants.imgHighHeelsIcon,
    'Bikini': AppImageConstants.imgBikiniIcon,
  };
}
