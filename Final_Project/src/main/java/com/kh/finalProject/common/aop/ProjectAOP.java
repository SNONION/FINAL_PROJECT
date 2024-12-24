package com.kh.finalProject.common.aop;

import org.aspectj.lang.annotation.Aspect;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
public class ProjectAOP {

	// 아래 정리된 설명을 참고하여 작성 (예시 포함)
	
	/*
	 * 간섭 메소드 (advise)
	 * - 특수한 경우가 아니라면 메소드의 형태는 정해져있다.
	 * - 어떠한 대상을 어떤 시점에 간섭할 것인지 어노테이션을 이용하여 등록
	 * 
	 * target : 특정 인터페이스와 그의 자식 클래스의 메소드를 지정
	 * within : 특정 패키지 or 클래스의 모든 메소드를 지정한다. ex) com.kh.spring.board.*
	 * execution : 표현식으로 형태를 지정하여 간섭한다.
	 * execution[접근제한] 반환형 풀클래스명.메소드명(매개변수 형태)
	 * - 매개변수 형태(*) : 매개변수가 하나인 경우 / (..) : 매개변수가 0개 이상인 경우(개수 상관 X)
	 * 
	 * 주요 어노테이션
	 * @Before : 지정한 메소드 실행 전 간섭
	 * @After : 지정한 메소드 실행 후 간섭	
	 * @AfterReturning : 지정한 메소드 정상 실행 후 간섭
	 * @AfterThrowing : 지정한 메소드에서 예외가 발생한 간섭
	 * @Around : 지정한 메소드 실행 전후 간섭
	 */
	
	/*
	 * 포인트컷 표현식 정리
	 * @Around("target(com.kh.spring.board.model.dao.BoardDao)")
	 * @Around("within(com.kh.spring.board.model.dao.*)") // 특정 타입내에 조인포인트 매칭(패키지 또는 클래스의 모든 메소드)
	 *		
	 * execution("반환형 패키지경로. * 모든클래스 또는 패키지. *(..) : 모든 메소드(매개변수 0개 이상)
	 * @Around("execution(* com.kh.spring.board.model.dao.*.*(..))")
	 *		
	 * selectList(..) : selectList 메소드의 매개변수 개수 상관없이 지정
	 * 만약 위 메소드가 오버로딩 되어있다면 오버로딩된 모든 메소드에 적용된다.
	 * 이를 피하고 싶다면 selectList(타입, 타입)와 같이 명확한 타입을 지정해야한다.
	 * @Around("execution(* com.kh.spring.board.model.dao.BoardDao.selectList(..))")
	 */
	
	
	
}
