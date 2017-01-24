package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.PetVo;
import com.hotdog.petcam.vo.UserVo;

@Repository
public class UserDao{

	@Autowired
	private SqlSession sqlSession;

	public int insert(UserVo userVo){
		sqlSession.insert("user.insert", userVo);
		System.out.println(userVo);
		System.out.println(userVo.getUsers_no());
		
		return userVo.getUsers_no();
	}
	
	public UserVo get(int users_no){
		return sqlSession.selectOne("user.getByNo", users_no);
	}
	
	public UserVo getId(String email){
		System.out.println(email + "email로 유저넘버 조회전");
		return sqlSession.selectOne("user.getById", email);
	}
	
	
	//이메일 파라미터로 유저넘버 조회  UserVo 형태의 authUser에 리턴
	public UserVo idExist(String email) {
		UserVo authUser = sqlSession.selectOne("user.idExist", email);
		return authUser;
	}
	
	//닉네임 파라미터로 유저넘버 조회  UserVo 형태의 authUser에 리턴
	public UserVo nicknameExist(String nickname){
		return sqlSession.selectOne("user.nicknameExist", nickname);
	}
	
	//맵형태의 email, password, nickname을 조회해 담고 UserVo형태의 authUser에 담아 리턴
	public UserVo selectForLogin(
								 String email, 
								 String pass_word, 
								 String nickname, 
								 String description,
								 String infomation,
								 String users_image,
								 String follower_num,
								 String following_num){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("email", email);
		map.put("pass_word", pass_word);
		map.put("nickname", nickname);
		map.put("description", description);
		map.put("infomation", infomation);
		map.put("users_image", users_image);
		map.put("follower_num", follower_num);
		map.put("following_num", following_num);
		
		UserVo authUser = sqlSession.selectOne("user.selectForLogin",map);
		System.out.println("UserDao login");
		return authUser;
	}
	
	public List<UserVo> getMainUserList(){
		return sqlSession.selectList("user.getMainUserList");
	}
	public List<UserVo> getMainMyUserList(){
		return sqlSession.selectList("user.getMainMyUserList");
	}
	
	// *******************************************************************************************************
	// **************************************** My Account ***************************************************
	// *******************************************************************************************************
	
	public void basicModify(UserVo userVo){
		sqlSession.update("user.basicModify", userVo);
	}
	public void userProfileModify(UserVo userVo){
		sqlSession.update("user.userprofileModify",userVo);
	}
	public void petrProfileModify(PetVo petVo){
		sqlSession.update("user.userprofileModify",petVo);
	}
	
}