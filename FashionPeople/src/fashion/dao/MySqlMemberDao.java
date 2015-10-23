package fashion.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import fashion.vo.Member;

public class MySqlMemberDao implements MemberDao {
	SqlSessionFactory sqlSessionFactory;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Member> selectList(HashMap<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Member member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectOne(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Member member) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member exist(String user_id, String pwd) throws Exception {
		HashMap<String, String> paramMap = new HashMap<String,String>();
		paramMap.put("user_id", user_id);
		paramMap.put("pwd", pwd);
		SqlSession sqlSession = sqlSessionFactory.openSession();
			try {
				return sqlSession.selectOne("fashion.dao.MemberDao.exist",paramMap);

			} finally {
				sqlSession.close();
			}
		}
}
