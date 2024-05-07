abstract class CartState {}

class CartInitial extends CartState {}

class DeleteItemFromCartListState extends CartState {}

class ItemDoesNotExistState extends CartState {}

class AddToFavoriteListState extends CartState {}

class RemovefromFavoriteListState extends CartState {}

class IncreaseItemToCartListState extends CartState {}
