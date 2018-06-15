package com.bit.nullnull.member.dao;

import java.util.List;

import com.bit.nullnull.member.model.Follow;

public interface FollowDao {

	Follow getFollow(Follow follow);

	void deleteFollow(Follow follow);

	void addFollow(Follow follow);

	List<Integer> getFollower_id(int member_id);

}
