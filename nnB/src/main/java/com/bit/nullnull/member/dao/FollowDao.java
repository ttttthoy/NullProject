package com.bit.nullnull.member.dao;

import com.bit.nullnull.member.model.Follow;

public interface FollowDao {

	Follow getFollow(Follow follow);

	void deleteFollow(Follow follow);

	void addFollow(Follow follow);

}
