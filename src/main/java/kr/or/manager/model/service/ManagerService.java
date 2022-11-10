package kr.or.manager.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.mail.controller.MailSender;
import kr.or.manager.model.dao.ManagerDao;
import kr.or.manager.model.vo.FileVOG;
import kr.or.manager.model.vo.Manager;
import kr.or.manager.model.vo.NoticeG;
import kr.or.manager.model.vo.NoticeGPageData;
import kr.or.member.model.vo.Member;
import kr.or.partner.model.vo.Partner;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	//관리자용 로그인
	public Manager selectOneManager(Manager manager) {
		Manager g = dao.selectOneManager(manager);
		return g;
	}
	
	//관리자 P 회원 수
	public int selectMemberList() {
			return dao.selectUserList();
	}
	//관리자 P 파트너 수 
	public int selectPartnerList() {
		return dao.selectPartnerCount() ;
	}
	// 관리자 P 총 인원
	public int selectTotalMember() {
		return dao.selectTotalMember();
	}
	//관리자p 회원리스트
	public ArrayList<Member> selectMemberPartnerList(Member m) {
		ArrayList<Member> list = dao.selectMemberPartnerList(m);
		return list;
	}
//유저리스트 검색
	public ArrayList<Member> searchMember(String memberType, String type, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("memberType",memberType);
		ArrayList<Member> list = null;
		if(memberType.equals("partner")) {
			list = dao.serchPartner(map);			
		}else {
			list = dao.searchMember(map);			
		}
		return list;
	}

	//유저 리스트 엑셀다운
	public void excelDown(HttpServletResponse response) throws IOException{
		//회원목록조회
		ArrayList<Member> list = dao.selectMemberPartnerList();
		
		// 워크북 생성
		Workbook wb = new XSSFWorkbook();
		//시트생성
		Sheet sheet = wb.createSheet("회원관리");
		//	3. 열 너비 설정
		sheet.setColumnWidth(0, 5500);
		sheet.setColumnWidth(1, 5500);
		sheet.setColumnWidth(2, 5500);
		sheet.setColumnWidth(3, 5500);
		sheet.setColumnWidth(4, 5500);
		
		//4.테이블 헤더 스타일 지정
		CellStyle headStyle = wb.createCellStyle();
		//데이터 가운데 정렬
		headStyle.setAlignment(HorizontalAlignment.CENTER);
			//경계선
	   	headStyle.setBorderTop(BorderStyle.THIN);
	   	headStyle.setBorderBottom(BorderStyle.THIN);
	   	headStyle.setBorderLeft(BorderStyle.THIN);
	   	headStyle.setBorderRight(BorderStyle.THIN);
	   		// 배경색은 연두색
	   	headStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_GREEN.getIndex());
	   	headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		
		//row 행 순서
		int rowNum = 0;
		Cell cell = null;
		Row row = null;
		
		//header
		int cellNum = 0;
		row = sheet.createRow(rowNum++);
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("아이디");
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");		
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("생년월일");
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("전화번호");
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("주소");
		cell=row.createCell(cellNum++);
		cell.setCellStyle(headStyle);
		cell.setCellValue("가입일");
		
		//6. 테이블 바디 스타일 지정
		CellStyle bodyStyle = wb.createCellStyle();
		//데이터 가운데 정렬
		bodyStyle.setAlignment(HorizontalAlignment.CENTER);
		

		//테이블 바디 내용
		for(Member m : list) {
			row = sheet.createRow(rowNum++);
			
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberName());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberBdate());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberPhone());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberAddr());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle); //가운데 정렬
			cell.setCellValue(m.getMemberEnrollDate());
		}
		
	      // 다운로드
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=SCDmember.xlsx");
        try {
            wb.write(response.getOutputStream());
        } finally {
            wb.close();
        }
	}
	
	//관리자 공지사항 리스트
	public NoticeGPageData selectAdminNotice(int reqPage) {
		int numPerPage = 10;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<NoticeG> list = dao.selectAdminNotice(map);
		
		int totalCount = dao.selectNoticeGCount();
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/adminNotice.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/adminNotice.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/adminNotice.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		NoticeGPageData ngpd = new NoticeGPageData(list, pageNavi, reqPage, numPerPage, totalCount);
		return ngpd;
	}
	
	public NoticeG selectOneNoticeG(int noticeGNo) {
		NoticeG ng = dao.selectOneNoticeG(noticeGNo);
		return ng;
	}

	public int insertNoticeG(NoticeG ng) {
		int result = dao.insertNoticeG(ng);
		if(result>0) {
			for(FileVOG fvg : ng.getFileList()) {
				fvg.setNoticeGNo(ng.getNoticeGNo());
				result += dao.insertFile(fvg);
			}
		}
		return result;
	}

	public int deleteNotice(NoticeG noticeGNo) {
		return dao.deleteNotice(noticeGNo);
	}
	
	
	
	public void readGCountUpdate(int noticeGNo) {
		dao.readGCountUpdate(noticeGNo);
		
	}
// 관리자 - 승인해야할 partner 불러오기 
	public ArrayList<Partner> partnerList(String type, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		return dao.partnerList(map);
	}
//관리자 - 파트너 승인
	public int upgradeOk(String pNo, String gradeType, String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", pNo);
		map.put("gradeType", gradeType);
		map.put("email", email);
		
		int result = 0;
		if(gradeType.equals("C")) {
		 result = dao.upgradeOk(map);			
		 	//성공메일발송
			 MailSender sender = new MailSender();
			 sender.partnerEamil(email);
		}else if(gradeType.equals("Z")) {
		 result = dao.deletePartner(map);
			//거절메일발송
			 MailSender sender = new MailSender();
			 sender.partnerCancel(email);
		}
		return result;
	}
//파트너 - 지원한 사람 상세보기
	public Partner selectOnePartner(String pNo) {
		// TODO Auto-generated method stub
		return dao.selectOnePartner(pNo);
	}
//파트너 수 
	public int nPartner() {
		return dao.partnerC();
	}
//파트너 승인 후 -> 등급별로 들어오는 곳 
	public ArrayList<Partner> partnerGradeList(String type, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		return dao.partnerGradeList(map);
	}
	
	public int gradePartner() {
		// TODO Auto-generated method stub
		return dao.gradePartner();
	}
	
}
