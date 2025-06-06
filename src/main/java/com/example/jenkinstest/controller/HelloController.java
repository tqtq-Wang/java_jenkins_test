package com.example.jenkinstest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "Hello World! Jenkins测试项目运行正常！";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }

    @GetMapping("/jenkins")
    public String jenkins() {
        return "Jenkins构建成功！当前时间: " + java.time.LocalDateTime.now();
    }
}
