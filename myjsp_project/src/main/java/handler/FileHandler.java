package handler;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileHandler {
	private static final Logger log = LoggerFactory.getLogger(FileHandler.class);
	
	public int deleteFile(String imageFileName, String savePath) {
		boolean isDel = true;
		
		File fDir = new File(savePath);
		File removeFile = new File(fDir+File.separator+imageFileName);
		File removeThFile = new File(fDir+File.separator+"_th_"+imageFileName);
		
		if(removeFile.exists() || removeThFile.exists()) {
			isDel = removeFile.delete();
			log.info((isDel)? "OK" : "Fail");
			if(isDel) {
				isDel = removeThFile.delete();
				log.info((isDel)? "OK" : "Fail");
			}
		}
		
		return isDel ? 1 : 0;
		
	}
}
