package com.project.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

//@Configuration // 환경설정파일이다.
//@PropertySource("classpath:application.properties") // application.properties를 사용하겠다.
//public class EmailConfig {
//
//    @Value("${spring.mail.username}") // application.properties.uesrname을 사용하겠다.
//    private String id;
//    @Value("${spring.mail.password}") // application.properties.password을 사용하겠다.
//    private String password;
//    @Value("${spring.mail.host}") // application.properties.host을 사용하겠다.
//    private String host;
//    @Value("${spring.mail.port}") // application.properties.port을 사용하겠다.
//    private int port;
//
//    @Bean // 인스턴스화
//    public JavaMailSender javaMailService() { // javaMailService 메소드는
//        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl(); // 객체 생성 JavaMailSenderImpl
//
//        javaMailSender.setHost(host); // smtp 서버 주소 설정	
//        javaMailSender.setUsername(id); // (발신) 메일 아이디 설정
//        javaMailSender.setPassword(password); // (발신) 메일 패스워드 설정
//        javaMailSender.setPort(port); // smtp port 설정
//        javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져와 설정
//        javaMailSender.setDefaultEncoding("UTF-8"); // 기본 인코딩 "UTF-8" 설정
//        return javaMailSender; // 반환 후 이메일 발송 기능 사용
//    }
//
//    private Properties getMailProperties() {  // 이메일 설정에 사용되는 Properties 객체를 생성하고 반환
//        Properties properties = new Properties(); // Properties 객체 생성
//        properties.setProperty("mail.transport.protocol", "smtp"); //  키와 값을 설정하여 이메일 전송에 사용할 프로토콜로 "smtp"를 사용하도록 지정
//        properties.setProperty("mail.smtp.auth", "true"); // SMTP 인증을 활성화하도록 설정
//        properties.setProperty("mail.debug", "true"); // JavaMail 디버그 기능을 사용하도록 설정
//        properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // SSL 인증 서버 주소로 "smtp.naver.com"을 지정 ,  SSL 보안을 사용하여 데이터를 암호화
//        properties.setProperty("mail.smtp.ssl.enable","true"); // SSL 사용을 활성화하도록 설정, 이메일 서버와의 모든 통신이 SSL을 통해 암호화
//        return properties; // Properties 객체는 이메일 발송 설정을 정의하는 데 사용
//    }
//}

@Configuration
@PropertySource("classpath:application.properties")
public class EmailConfig {

    @Value("${spring.mail.username}")
    private String id;
    @Value("${spring.mail.password}")
    private String password;
    @Value("${spring.mail.host}")
    private String host;
    @Value("${spring.mail.port}")
    private int port;

    @Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost(host); // smtp 서버 주소
        javaMailSender.setUsername(id); // 설정(발신) 메일 아이디
        javaMailSender.setPassword(password); // 설정(발신) 메일 패스워드
        javaMailSender.setPort(port); //smtp port
        javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져온다.
        javaMailSender.setDefaultEncoding("UTF-8");
        return javaMailSender;
    }

    private Properties getMailProperties() {
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp"); // 프로토콜 설정
        properties.setProperty("mail.smtp.auth", "true"); // smtp 인증
        properties.setProperty("mail.smtp.starttls.enable", "true"); // smtp starttls 사용
        properties.setProperty("mail.debug", "true"); // 디버그 사용
        properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // ssl 인증 서버 주소
        properties.setProperty("mail.smtp.ssl.enable","true"); // ssl 사용
        return properties;
    }
}