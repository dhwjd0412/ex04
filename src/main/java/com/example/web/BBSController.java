package com.example.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.persistence.BBSDAO;

@Controller
public class BBSController {
	@Inject
	BBSDAO dao;
	
	@RequestMapping("list")
	public String list(Integer start,Model model,String word,String key){
		if(key==null) key="title";
		if(word==null) word="";
		if(start==null) start=0;
		
		model.addAttribute("list",dao.list(start,key,word));
		model.addAttribute("total",dao.total(key,word));
		
		model.addAttribute("key",key);
		model.addAttribute("word",word);
		model.addAttribute("start",start);
		return "list";
	}
}
