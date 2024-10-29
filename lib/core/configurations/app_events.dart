abstract class AppEvent {}

class ClickEvent extends AppEvent {}

class AddEvent extends AppEvent {
  final dynamic data;
  AddEvent(this.data);
}

class RemoveEvent extends AppEvent {
  final dynamic data;
  RemoveEvent(this.data);
}

class CheckEvent extends AppEvent {}

class SearchEvent extends AppEvent {}

class GetDataEvent extends AppEvent {}

class UpdateEvent extends AppEvent {}

class ChooseEvent extends AppEvent {
  final dynamic data;
  ChooseEvent(this.data);
}
