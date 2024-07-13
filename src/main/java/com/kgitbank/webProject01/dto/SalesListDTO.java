package com.kgitbank.webProject01.dto;

public class SalesListDTO {
	private int no;
	private MemberDTO mdto;
	private ProductDTO pdto;
	private int pqty;
	private String sales_date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public MemberDTO getMdto() {
		return mdto;
	}
	public void setMdto(MemberDTO mdto) {
		this.mdto = mdto;
	}
	public ProductDTO getPdto() {
		return pdto;
	}
	public void setPdto(ProductDTO pdto) {
		this.pdto = pdto;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
}
