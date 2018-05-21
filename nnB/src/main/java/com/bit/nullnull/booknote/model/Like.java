package com.bit.nullnull.booknote.model;

public class Like {
	
	private int note_id;
	private int mem_id;
	
	public Like() {}
	
	public Like(int note_id, int mem_id) {
		super();
		this.note_id = note_id;
		this.mem_id = mem_id;
	}

	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}

	public int getMem_id() {
		return mem_id;
	}

	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "Like [note_id=" + note_id + ", mem_id=" + mem_id + "]";
	}
	
}
