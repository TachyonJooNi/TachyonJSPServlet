package model2.mvcboard;

public class MVCBoardDTO {
	//멤버변수
    private String idx;		//일련번호
    private String name;	//작성자명
    private String title;	//제목
    private String content;	//내용
    //--날짜를 String으로 해도 되지만 여기서는 Date를 사용해봄.
    private java.sql.Date postdate; //작성일
    private String ofile;	//원본파일명
    private String sfile;	//서버에 저장된 파일명
    private int downcount;	//다운로드 횟수
    private String pass;	//비밀번호
    private int visitcount;	//게시물 조회수
    
    //생성자는 디폴트생성자만 쓰겠다(생성하지 않음)
    
    // getter / setter 선언
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
}
