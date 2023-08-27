part of 'note_view_cubit.dart';

@immutable
abstract class NoteViewState {}

class NoteViewInitial extends NoteViewState {}
class NoteViewSuccess extends NoteViewState {}
class NoteViewLoading extends NoteViewState {}
class NoteViewFailure extends NoteViewState {}

