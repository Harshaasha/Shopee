import 'package:bloc/bloc.dart';
import '../data/Item_Model/ModelClass.dart';
import '../data/Repository/Item_repository.dart';

// Events
abstract class ItemEvent {}

class FetchItems extends ItemEvent {}

// States
abstract class ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Products> items;
  ItemLoaded(this.items);
}

class ItemError extends ItemState {
  final String message;
  ItemError(this.message);
}

// Bloc
class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;

  ItemBloc(this.repository) : super(ItemLoading()) {
    on<FetchItems>((event, emit) async {
      try {
        emit(ItemLoading());
        final items = await repository.getItems();
        emit(ItemLoaded(items));
      } catch (e) {
        emit(ItemError('Failed to load items'));
      }
    });
  }
}
