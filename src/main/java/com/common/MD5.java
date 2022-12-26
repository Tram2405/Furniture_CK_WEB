package com.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	public String md5(String str){
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());
			
			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println((new MD5()).md5("12345"));
	}

}
