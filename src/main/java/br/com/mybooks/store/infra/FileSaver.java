package br.com.mybooks.store.infra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Component
public class FileSaver {

    @Autowired
    private HttpServletRequest request;

    public String write(String baseFolder, MultipartFile file) {
        try {
            // String realPath = request.getServletContext().getRealPath("/" + baseFolder);
            // String path = realPath + "/" + file.getOriginalFilename();
            String path = "/home/software01/Workspace/mybooks/src/main/webapp/summary-files/" + file.getOriginalFilename();
            file.transferTo(new File(path));

            return baseFolder + "/" + file.getOriginalFilename();
        } catch (IOException | IllegalStateException e) {
            throw new RuntimeException(e);
        }
    }
}
