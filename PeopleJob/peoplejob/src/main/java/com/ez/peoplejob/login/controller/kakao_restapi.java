package com.ez.peoplejob.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class kakao_restapi {
	
	/*
	public JsonNode getAccessToken(String autorize_code) {
		 
	    final String RequestUrl = "https://kauth.kakao.com/oauth/token";

	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

	    postParams.add(new BasicNameValuePair("client_id", "2cf3b4aff785f5ac3fea03db7cc7efdd"));

	    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/peoplejob/oauth"));

	    postParams.add(new BasicNameValuePair("code", autorize_code));

	    final HttpClient client = HttpClientBuilder.create().build();

	    final HttpPost post = new HttpPost(RequestUrl);

	    JsonNode returnNode = null;

	    try {

	        post.setEntity(new UrlEncodedFormEntity(postParams));

	        final org.apache.http.HttpResponse response = client.execute(post);
	        
	        ObjectMapper mapper = new ObjectMapper();

	        returnNode = mapper.readTree(response.getEntity().getContent());

	    } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();

	    } catch (ClientProtocolException e) {

	        e.printStackTrace();

	    } catch (IOException e) {

	        e.printStackTrace();

	    } finally {

	    }

	    return returnNode;

	}
	*/
	
	  public JsonNode getAccessToken(String autorize_code) {
	        
	        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	 
	        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	        
	        //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
	        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	 
	        postParams.add(new BasicNameValuePair("client_id", "2cf3b4aff785f5ac3fea03db7cc7efdd"));
	 
	        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/peoplejob/oauth")); //예 : http://아이피:포트/최상위폴더/리다이렉션경로
	 
	        postParams.add(new BasicNameValuePair("code", autorize_code));

	        final HttpClient client = HttpClientBuilder.create().build();
	 
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        JsonNode returnNode = null;
	 
	        try {
	 
	            post.setEntity(new UrlEncodedFormEntity(postParams));
	 
	            final HttpResponse response = client.execute(post);
	 
	            ObjectMapper mapper = new ObjectMapper();
	 
	            returnNode = mapper.readTree(response.getEntity().getContent());
	 
	        } catch (UnsupportedEncodingException e) {
	 
	            e.printStackTrace();
	 
	        } catch (ClientProtocolException e) {
	 
	            e.printStackTrace();
	 
	        } catch (IOException e) {
	 
	            e.printStackTrace();
	 
	        } finally {
	 
	        }
	 
	        return returnNode;
	 
	    }


}
