package fashion.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import fashion.annotation.Component;
import fashion.bind.DataBinding;
import fashion.dao.MemberDao;
import fashion.vo.Member;

@Component("/login/login.do")
public class LogInController implements Controller, DataBinding {
	MemberDao memberDao;

	public LogInController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Member loginInfo = (Member) model.get("loginInfo");
		if (loginInfo.getUser_id() == null) { // 입력폼을 요청할 때
			return "/login/LoginForm.jsp";

		} else { // 회원 등록을 요청할 때
			Member member = memberDao.exist(loginInfo.getUser_id(), loginInfo.getPwd());

			if (member != null) {
				HttpSession session = (HttpSession) model.get("session");
				session.setAttribute("member", member);
				return "redirect:../member/list.do";
			} else {
				return "/login/LoginFail.jsp";
			}
		}
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] { "loginInfo", fashion.vo.Member.class };
	}
}
