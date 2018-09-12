package com.kh.chemin.mall.model.vo;

import java.sql.Date;

public class QnA_board 
{
	private int	qnaNo;         
	private String userId;
	private int pno;            
	private int qna_cate_no;
	private String qnaTitle;
	private String qnaContent;
	private String qnaReply;
	private Date qnaDate;
	private String qnaState;
	private int qnaPw;
	
	public QnA_board() {}

	public QnA_board(int qnaNo, String userId, int pno, int qna_cate_no, String qnaTitle, String qnaContent,
			String qnaReply, Date qnaDate, String qnaState, int qnaPw) {
		super();
		this.qnaNo = qnaNo;
		this.userId = userId;
		this.pno = pno;
		this.qna_cate_no = qna_cate_no;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaReply = qnaReply;
		this.qnaDate = qnaDate;
		this.qnaState = qnaState;
		this.qnaPw = qnaPw;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getQna_cate_no() {
		return qna_cate_no;
	}

	public void setQna_cate_no(int qna_cate_no) {
		this.qna_cate_no = qna_cate_no;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaReply() {
		return qnaReply;
	}

	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaState() {
		return qnaState;
	}

	public void setQnaState(String qnaState) {
		this.qnaState = qnaState;
	}

	public int getQnaPw() {
		return qnaPw;
	}

	public void setQnaPw(int qnaPw) {
		this.qnaPw = qnaPw;
	}

	@Override
	public String toString() {
		return "QnA_board [qnaNo=" + qnaNo + ", userId=" + userId + ", pno=" + pno + ", qna_cate_no=" + qna_cate_no
				+ ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaReply=" + qnaReply + ", qnaDate="
				+ qnaDate + ", qnaState=" + qnaState + ", qnaPw=" + qnaPw + "]";
	}
	
	
	
}
