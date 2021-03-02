package team;

import java.util.Iterator;

import org.apache.catalina.connector.RequestFacade;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {
	 Logger logger = LoggerFactory.getLogger(LogAspect.class);
	 
	 @Around("@annotation(LogExecute)")
	 public Object logAop(ProceedingJoinPoint joinPoint) throws Throwable {
		 System.out.println("logAOP 실행 부분");
		 String className = joinPoint.getTarget().getClass().getName();
		 System.out.println("실행된 클래스명 : " + className);
		 String methodName = joinPoint.getSignature().getName();
		 System.out.println("실행된 메소드명 : " + methodName);
		 
		 //적용된 메소드 실행
		 Object result = null;
		 try {
			 result = joinPoint.proceed();
		 } catch(Exception e) {
			 System.out.println("AOP - Exception\n" + e.getMessage());
			 result ="error";
		 }
		 //메소드 실행 후 처리부분
		 Object[] args = joinPoint.getArgs();
		 for(int i=0;i<args.length;i++) {
			 System.out.println(args[i].toString());
			 if(args[i].getClass().getSimpleName().equals("RequestFacade")) {
				 RequestFacade request = (RequestFacade) args[i];
				 Iterator<String> it = request.getParameterNames().asIterator();
				 while(it.hasNext()) {
					 String param = it.next();
					 System.out.println(param + " : " + request.getParameter(param));
				 }
			 }
		 }
		 
		 System.out.println("메소드 실행 결과 : "+result.toString());
		 
		 System.out.println("logAOP 종료 부분");
		 return result;
	 }
	 
}
