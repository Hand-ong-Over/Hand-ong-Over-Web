package edu.handong.handongover.board;

import java.time.LocalDateTime;
import java.sql.Date;

public class FindPersonVO {
    private int article_id;
    private String writer;
    private String title;
    private Date start_date;
    private Date end_date;
    private String room_type;
    private float room_size;
    private String address;
    private float location_latitude;
    private float location_longitude;
    private String location_info;
    private int price;
    private String images;
    private String additional_info;
    private int num_of_people;
    private int sex;
    private int smoke;
    private int pet;
    private int alcohol;
    private LocalDateTime reg_date;

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public float getRoom_size() {
        return room_size;
    }

    public void setRoom_size(float room_size) {
        this.room_size = room_size;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getLocation_latitude() {
        return location_latitude;
    }

    public void setLocation_latitude(float location_latitude) {
        this.location_latitude = location_latitude;
    }

    public float getLocation_longitude() {
        return location_longitude;
    }

    public void setLocation_longitude(float location_longitude) {
        this.location_longitude = location_longitude;
    }

    public String getLocation_info() {
        return location_info;
    }

    public void setLocation_info(String location_info) {
        this.location_info = location_info;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getAdditional_info() {
        return additional_info;
    }

    public void setAdditional_info(String additional_info) {
        this.additional_info = additional_info;
    }

    public int getNum_of_people() {
        return num_of_people;
    }

    public void setNum_of_people(int num_of_people) {
        this.num_of_people = num_of_people;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getSmoke() {
        return smoke;
    }

    public void setSmoke(int smoke) {
        this.smoke = smoke;
    }

    public int getPet() {
        return pet;
    }

    public void setPet(int pet) {
        this.pet = pet;
    }

    public int getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(int alcohol) {
        this.alcohol = alcohol;
    }

    public LocalDateTime getReg_date() {
        return reg_date;
    }

    public void setReg_date(LocalDateTime reg_date) {
        this.reg_date = reg_date;
    }
}
