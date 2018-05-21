package com.bit.nullnull.booknote.dao;

import java.util.List;

import com.bit.nullnull.book.model.Book;
import com.bit.nullnull.booknote.model.Note;

public interface NoteDao {

	int insertNote(Note note);

	List<String> selectBookList();

	Note selectNoteById(int id);
	
	int deleteNote(Note note);

	List<Note> selectNoteList();

	Book selectABook(Note note);

	int updateNote(Note note);

	Note countJoayo(int note_id);

	List<Note> selectNoteListByIsbn(String isbn);

}
