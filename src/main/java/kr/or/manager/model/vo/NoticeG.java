package kr.or.manager.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeG {
	private int noticeGNo;
	private String noticeGTitle;
	private String noticeGContent;
	private String noticeGWriter;
	private String noticeGDate;
	private int readGCount;
	private ArrayList<FileVOG> fileList;
}
