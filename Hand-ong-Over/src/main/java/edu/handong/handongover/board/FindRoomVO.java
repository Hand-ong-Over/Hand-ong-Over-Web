package edu.handong.handongover.board;

import java.time.LocalDateTime;

public class FindRoomVO {
    private int seq;
    private String writer;
    private String title;
    private String start_date;
    private String end_date;
    private String room_type;
    private int price;
    private int num_of_people;
    private int sex;
    private int smoke;
    private int alcohol;
    private int pet;
    private String additional_info;
    private LocalDateTime reg_date;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
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

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public int getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(int alcohol) {
        this.alcohol = alcohol;
    }

    public int getPet() {
        return pet;
    }

    public void setPet(int pet) {
        this.pet = pet;
    }

    public String getAdditional_info() {
        return additional_info;
    }

    public void setAdditional_info(String additional_info) {
        this.additional_info = additional_info;
    }

    public LocalDateTime getReg_date() {
        return reg_date;
    }

    public void setReg_date(LocalDateTime reg_date) {
        this.reg_date = reg_date;
    }
}