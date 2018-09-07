package com.kh.chemin.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayType implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		// 값을 집어넣었을때 알아서 return됨. int i은 index번호, jdbctype은 jdbc에서 어떤 타입으로 가져오는지, parameter는 가져오는 값
		if(parameter!=null) {
			ps.setString(i, String.join(",", parameter)); //,를 중심으로 들어온 parameter값을 (이쁘게)합침.ps는 mybatis가 알아서 보내줌
		}
		else {
			ps.setString(i, "");
		}

	}
	// 타입으로 가져오기. 
	//1) 이름으로 가져오기
	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String columnValue=rs.getString(columnName);
		String[] columnArray=columnValue.split(","); 
		return columnArray;
	}

	//2) index로 가져오기
	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String columnValue=rs.getString(columnIndex);
		String[] columnArray=columnValue.split(",");
		return columnArray;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String columnValue=cs.getString(columnIndex);
		String[] columnArray=columnValue.split(",");
		return columnArray;
	}

}
