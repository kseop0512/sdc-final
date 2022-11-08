package kr.or.manager.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVOG {
	private int fileGNo;
	private int noticeGNo;
	private String filenameG;
	private String filepathG;
}
