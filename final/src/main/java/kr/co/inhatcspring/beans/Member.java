package kr.co.inhatcspring.beans;

public class Member {
    private String userID;
    private String password;
    private String nickname;
    private char isManager;

    // 기본 생성자
    public Member() {}

    // 매개변수 있는 생성자
    public Member(String userID, String password, String nickname, char isManager) {
        this.userID = userID;
        this.password = password;
        this.nickname = nickname;
        this.isManager = isManager;
    }

    // Getter 및 Setter 메서드
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public char getIsManager() {
        return isManager;
    }

    public void setIsManager(char isManager) {
        this.isManager = isManager;
    }

    // toString 메서드
    @Override
    public String toString() {
        return "MemberDTO{" +
                "userID='" + userID + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", isManager=" + isManager +
                '}';
    }
}