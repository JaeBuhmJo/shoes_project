package com.project.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@PropertySource("classpath:application.properties") // application.properties를 사용하겠다.
@Slf4j
@RequiredArgsConstructor // @RequiredArgsConstructor은 클래스의 final 필드를 기반으로 파라미터를 갖는 생성자를 자동으로 생성
@Service
public class EmailService {
	
    private final JavaMailSender javaMailSender; // @Autowired 대신  @RequiredArgsConstructor 대체
    
  	//인증번호 생성
    private final String ePw = createKey();

    @Value("${spring.mail.username}") // application.properties.uesrname을 사용하겠다.
    private String id;

    public MimeMessage createMessage(String to)throws MessagingException, UnsupportedEncodingException {
        log.info("보내는 대상 : "+ to); // 이메일 대상
        log.info("인증 번호 : " + ePw); // 인증번호
        MimeMessage message = javaMailSender.createMimeMessage();// MimeMessage는 복잡한 이메일 메시지 구조와 포맷을 다룰 수 있는 클래스

        message.addRecipients(MimeMessage.RecipientType.TO, to); // TO 유형의 수신자에게 이메일을 발송하도록 설정합니다
        message.setSubject("shoes 회원가입 인증 코드: "); // 이메일 제목을 설정합니다.

        // 메일 내용 메일의 subtype을 html로 지정하여 html문법 사용 가능
        String msg="";
        msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">이메일 인증번호 확인</h1>";
        msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\">아래 확인 코드를 회원가입 화면에서 입력해주세요.</p>";
        msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 0; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
        msg += ePw;
        msg += "</td></tr></tbody></table></div>";

        message.setText(msg, "utf-8", "html"); //  메일 본문, 인코딩 방식, 정의 타입을 지정
        message.setFrom(new InternetAddress(id,"캡틴잭스페로우")); // 보내는 사람의 메일 주소, 보내는 사람 이름 지정

        return message; // 설정이 완료된 MimeMessage 객체를 반환
    }

    // 인증코드 만들기
    public static String createKey() {
        StringBuffer key = new StringBuffer(); // StringBuffer 객체 생성
        Random rnd = new Random(); // Random 객체 생성

        for (int i = 0; i < 6; i++) { // 인증코드 6자리
            key.append((rnd.nextInt(10))); // 0부터 9까지의 난수를 생성
        }
        return key.toString(); // StringBuffer를 문자열로 변환한 후 반환 
    }

    /*
        메일 발송
        sendSimpleMessage의 매개변수로 들어온 to는 인증번호를 받을 메일주소
        MimeMessage 객체 안에 내가 전송할 메일의 내용을 담아준다.
        bean으로 등록해둔 javaMailSender 객체를 사용하여 이메일 send
     */
    public String sendSimpleMessage(String to)throws Exception {
        MimeMessage message = createMessage(to);
        try{
            javaMailSender.send(message); // 메일 발송
        }catch(MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        }
        return ePw; // 메일로 보냈던 인증 코드를 컨트롤로 리턴
    }
}