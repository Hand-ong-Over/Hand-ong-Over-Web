package edu.handong.handongover.board;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FindPersonFileUpload {
    public FindPersonVO uploadPhoto(HttpServletRequest request) {
        String filenames = "";
        List<String> filenameList = new ArrayList<>();

        int sizeLimit = 15 * 1024 * 1024;

        String savePath = request.getServletContext().getRealPath("/resources/upload");

        File dir = new File(savePath);
        if (!dir.exists()) dir.mkdirs();

        FindPersonVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            for (int i = 0; multipartRequest.getFilesystemName("imageFile" + i) != null; i++) {
                filenameList.add(multipartRequest.getFilesystemName("imageFile" + i));
            }
            for (int i = 0; i < filenameList.size(); i++) {
                if (i == 0) {
                    filenames += filenameList.get(i);
                } else {
                    filenames += ";" + filenameList.get(i);
                }
            }

            one = new FindPersonVO();
            String article_id = multipartRequest.getParameter("article_id");
            if (article_id != null && !article_id.equals(""))
                one.setArticle_id(Integer.parseInt(article_id));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setStart_date(Date.valueOf(multipartRequest.getParameter("start_date")));
            one.setEnd_date(Date.valueOf(multipartRequest.getParameter("end_date")));
            one.setRoom_type(multipartRequest.getParameter("room_type"));
            one.setRoom_size(Float.parseFloat(multipartRequest.getParameter("room_size")));
            one.setAddress(multipartRequest.getParameter("address"));
//            one.setLocation_latitude(Float.parseFloat(multipartRequest.getParameter("location_latitude")));
//            one.setLocation_longitude(Float.parseFloat(multipartRequest.getParameter("location_longitude")));
            one.setLocation_info(multipartRequest.getParameter("location_info"));
            one.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
            one.setAdditional_info(multipartRequest.getParameter("Additional_info"));
            one.setNum_of_people(Integer.parseInt(multipartRequest.getParameter("num_of_people")));
            one.setSex(Integer.parseInt(multipartRequest.getParameter("sex")));
            one.setSmoke(Integer.parseInt(multipartRequest.getParameter("smoke")));
            one.setAlcohol(Integer.parseInt(multipartRequest.getParameter("alcohol")));
            one.setPet(Integer.parseInt(multipartRequest.getParameter("pet")));
            one.setImages(filenames);

            System.out.println("title: " + one.getTitle());
            System.out.println("writer: " + one.getWriter());
            System.out.println("start_date: " + one.getStart_date());
            System.out.println("end_date: " + one.getEnd_date());
            System.out.println("room_type: " + one.getRoom_type());
            System.out.println("room_size: " + one.getRoom_size());
            System.out.println("address: " + one.getAddress());
//            System.out.println("location_latitude: " + one.getLocation_latitude());
//            System.out.println("location_longitude: " + one.getLocation_longitude());
            System.out.println("location_info: " + one.getLocation_info());
            System.out.println("price: " + one.getPrice());
            System.out.println("Additional_info: " + one.getAdditional_info());
            System.out.println("num_of_people: " + one.getNum_of_people());
            System.out.println("sex: " + one.getSex());
            System.out.println("smoke: " + one.getSmoke());
            System.out.println("alcohol: " + one.getAlcohol());
            System.out.println("pet: " + one.getPet());
            System.out.println("images: " + one.getImages());

            if (article_id != null && !article_id.equals("")) {
                FindPersonDAO dao = new FindPersonDAO();
                String oldFilenames = dao.getFindPerson(Integer.parseInt(article_id)).getImages();

                if (filenames != null && oldFilenames != null)
                    FindPersonFileUpload.deleteFile(request, oldFilenames);
                else if (filenames == null && oldFilenames != null)
                    filenames = oldFilenames;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filenames) {
        String savePath = request.getServletContext().getRealPath("/resources/upload");
        String[] files = filenames.split(";");
        for (String file : files) {
            File f = new File(savePath + "/" + file);
            if (f.exists()) f.delete();
        }
    }
}