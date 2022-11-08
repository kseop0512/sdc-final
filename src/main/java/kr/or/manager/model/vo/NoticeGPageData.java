package kr.or.manager.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeGPageData {
	private ArrayList<NoticeG> list;
	private String pagenavi;
	private int reqPage;
	private int numPerPage;
	private int totalCount;
}
