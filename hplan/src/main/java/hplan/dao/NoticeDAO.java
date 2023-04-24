package hplan.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import hplan.dto.NoticeDTO;
import sqlmap.MybatisManager;

public class NoticeDAO {

	public int conut() {
		int result = 0;
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			result = session.selectOne("noticeBoard.count");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<NoticeDTO> noticeList(int start, int end) {
		List<NoticeDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("noticeBoard.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<NoticeDTO> searchList(String search_option, String keyword) {
		List<NoticeDTO> list = null;
		
		try(SqlSession session = MybatisManager.getInstance().openSession()){
			Map<String, Object> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list= session.selectList("noticeBoard.searchList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void plusReadCount(int num, HttpSession count_session) {
	SqlSession session = null;
	try {
		session = MybatisManager.getInstance().openSession();
		long read_time = 0;
		if(count_session.getAttribute("read_time_"+num) != null) {
			read_time=(long)count_session.getAttribute("read_time_"+num);
		}
		long current_time=System.currentTimeMillis(); // 현재 시각
		if(current_time-read_time > 5*1000) {
			session.update("noticeBoard.plusReadCount",num);
			session.commit();
			
			count_session.setAttribute("read_time_"+num, current_time);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(session != null) session.close();
	}
		
	}

	public NoticeDTO view(int num) {
		NoticeDTO dto = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("noticeBoard.view", num);
			String content = dto.getContent();
			content=content.replaceAll("/(\n|\r\n)/g", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void insert(NoticeDTO dto) {
		SqlSession session = null;
				try {
					session = MybatisManager.getInstance().openSession();
					session.insert("noticeBoard.insert", dto);
					session.commit();
							
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(session != null ) session.close();
				}
	}

	public void update(NoticeDTO dto) {
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("noticeBoard.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public void delete(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("noticeBoard.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

}
