package kr.or.common;

import org.springframework.stereotype.Component;

import java.io.File;

@Component
public class FileRename {
    public String fileRename(String path, String filename) {
        String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
        String extention = filename.substring(filename.lastIndexOf("."));
        String filepath = null;

        int cnt = 0;
        while(true) {
            if(cnt == 0) {
                filepath = onlyFilename+extention;
            } else {
                filepath = onlyFilename+"_"+cnt+extention;
            }
            File checkFile = new File(path + filepath);
            if(!checkFile.exists()) {
                break;
            }
            cnt++;
        }

        return filepath;
    }
}
