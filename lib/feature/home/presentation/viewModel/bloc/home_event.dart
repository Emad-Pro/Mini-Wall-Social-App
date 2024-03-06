part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SignUpHomeEvent extends HomeEvent {}

class AddPostHomeEvent extends HomeEvent {
  final String message;

  const AddPostHomeEvent({required this.message});
}

class GetPostsHomeEvent extends HomeEvent {}
