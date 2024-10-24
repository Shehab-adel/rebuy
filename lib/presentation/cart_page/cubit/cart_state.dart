abstract class CartState {}

class CartInitial extends CartState {}

class DecreaseItemFromCartListState extends CartState {}

class ItemDoesNotExistState extends CartState {}

class AddToFavoriteListState extends CartState {}

class RemovefromFavoriteListState extends CartState {}

class DeleteItemFromCartListState extends CartState {}

class SuccessfulIncreaseItemToCartState extends CartState {}

class SumOfItemsPriceState extends CartState {}

class ChangeCountState extends CartState {}

class SumOfItemsPriceByPlusIconState extends CartState {}

class DeleteItemFromFavoriteList extends CartState {}
