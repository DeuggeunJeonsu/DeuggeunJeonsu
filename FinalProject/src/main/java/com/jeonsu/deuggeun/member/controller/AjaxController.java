/*
 * package com.jeonsu.deuggeun.member.controller;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import com.jeonsu.deuggeun.member.model.service.AjaxService;
 * 
 * @Controller public class AjaxController {
 * 
 * @Autowired private AjaxService service;
 * 
 * @GetMapping("/dupCheck/email")
 * 
 * @ResponseBody public int checkEmail(@RequestParam("email") String email) {
 * 
 * return service.checkEmail(email); }
 * 
 * }
 */