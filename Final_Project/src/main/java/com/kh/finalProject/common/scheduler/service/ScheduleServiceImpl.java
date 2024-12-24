package com.kh.finalProject.common.scheduler.service;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService{
		
	/*
	 * 스케줄러 사용법
	 * 메소드에 @Scheduled() 어노테이션을 부여하면 된다.
	 * 이떄 어떠한 간격으로 스케줄러를 동작시킬 것인지 추가하여야 한다.
	 * initialDelay : 시작하고 ~ 뒤에 실행 (1000 == 1초)
	 * fixedDelay : 고정값으로 설정된 시간 마다 실행
	 * 와 같은 기본 설정과
	 * 상세한 설정을 할 수 있는 cron 표기식이 사용된다.
	 * 
	 * cron 표기식
	 * * : 모든값을 의미 매분 / 매시 / 매초 등등
	 * ? : 사용하지 않음 (미지정) - day of month / day of week 필드에서 사용
	 * - : 특정 기간을 의미 - 10-13 은 10시, 11시, 12시, 13시를 의미
	 * / : 반복 단위 - ex) 별/5는 매 5단위
	 * L : 마지막 날짜에 동작 (day of month / day of week)에서 동작
	 * W : 가까운 평일에 동작 (day of month)에서 사용
	 * LW : 그달의 마지막 평일 
	 * # : 몇번째 주 인지와 요일 설정 day of week에서 사용
	 * 	   ex) 5#2이면 2번째 주 목요일
	 * 
	 * cron 표기식 각 위치는
	 * 초 분 시 일 월 요일 연도(선택) 로 이루어져 있음
	 * @Scheduled(cron = "* * * * * *") // 1초마다 수행
	 * @Scheduled(cron = "0 * * * * *") // 매 분마다 실행 - 초가 0이되는 순간은 분이 올라갈떄 뿐이기 떄문이다.
	 * @Scheduled(cron = "0 0 * * * *") // 매 시간마다 실행
	 * @Scheduled(cron = "0 0 0 * * *") // 매일 자정마다 실행
	 * @Scheduled(cron = "0 0 6 * * *") // 매일 아침 6시마다 실행
	 * @Scheduled(cron = "0 0 8 1 * *") // 매월 1일 아침 8시마다 실행
	 */
	
}
