part of 'note_view_cubit.dart';

@immutable
abstract class NoteViewState {}

class NoteViewInitial extends NoteViewState {}
class NoteViewSuccess extends NoteViewState {
  final List<NoteModel> notes;

  NoteViewSuccess(this.notes);
}
class NoteViewLoading extends NoteViewState {}
class NoteViewFailure extends NoteViewState {
  final String errMessage;

  NoteViewFailure(this.errMessage);
}

