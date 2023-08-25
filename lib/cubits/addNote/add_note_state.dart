part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {

}

class AddNoteInitial extends AddNoteState {}
class AddNoteLoading extends AddNoteState {}
class AddNoteFailure extends AddNoteState {
 final String message;
  AddNoteFailure({required this.message});
}
class AddNoteSuccess extends AddNoteState {}
