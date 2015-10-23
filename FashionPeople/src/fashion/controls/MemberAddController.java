package fashion.controls;

import java.util.Map;

import fashion.annotation.Component;
import fashion.bind.DataBinding;
import fashion.dao.MemberDao;
import fashion.vo.Member;

@Component("/member/add.do")
public class MemberAddController implements Controller, DataBinding {
	MemberDao memberDao;

	public MemberAddController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] { "member", Member.class };
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Member member = (Member) model.get("member");
		if (member.getUser_id() == null) {
			return "/member/member_join.jsp";
		} else {
			memberDao.insert(member);
			return "redirect:main.do";
		}
	}
}
