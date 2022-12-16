package kr.co.ezen.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.interceptor.CheckLoginInterceptor;
import kr.co.ezen.mapper.AcademyMemberMapper;
import kr.co.ezen.mapper.BlackListMapper;
import kr.co.ezen.mapper.BoardMapper;
import kr.co.ezen.mapper.FaqMapper;
import kr.co.ezen.mapper.MemberMapper;
import kr.co.ezen.mapper.PayMapper;
import kr.co.ezen.mapper.ServiceCenterMapper;
import kr.co.ezen.mapper.SiteAcaAskMapper;
import kr.co.ezen.mapper.SiteAskMapper;

@Configuration
//Controller
@EnableWebMvc
@ComponentScan("kr.co.ezen.controller")
@ComponentScan("kr.co.ezen.dao")
@ComponentScan("kr.co.ezen.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
	
	@Value("${db.classname}")//oracle.jdbc.OracleDriver
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	@Autowired
	private AcademyMemberBean loginAcademyMemberBean;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
//		WebMvcConfigurer.super.addResourceHandlers(registry);
        registry
        .addResourceHandler("/**","board/**","faq/**","serviceBoard/**","member/**","academymember/**","blackList/**","pay/**")
        .addResourceLocations("/resources/"); 
	}
	
	//데이터베이스 접속 정보 관리하는 빈 등록
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		
		
		return source;
		
	}
	
	//Query문과 접속 정보를 관리하는 객체 생성
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		
		SqlSessionFactoryBean fSessionFactory = new SqlSessionFactoryBean();
		fSessionFactory.setDataSource(source);
		
		SqlSessionFactory factory = fSessionFactory.getObject();
		
		return factory;
	}
	
	//MemberMapper 등록
	@Bean
	public MapperFactoryBean<MemberMapper> getUserMapper(SqlSessionFactory factory){
		MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
				
		factoryBean.setSqlSessionFactory(factory);
				
		return factoryBean;
				
	}
	
	//아카데미Mapper 등록
	@Bean
	public MapperFactoryBean<AcademyMemberMapper> getAcademyMemberMapper(SqlSessionFactory factory){
		MapperFactoryBean<AcademyMemberMapper> factoryBean = new MapperFactoryBean<AcademyMemberMapper>(AcademyMemberMapper.class);
							
		factoryBean.setSqlSessionFactory(factory);
							
		return factoryBean;
							
		}
			
		//
	
	
	//두개의 서로 다른 properties 설정이 충돌나지 않도록 합니다.
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
		
	}
	
	//메시지 등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}
	
	//스탠다드서블릿멀티파트리졸버 등록 (upload/download 용도)
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		
		return new StandardServletMultipartResolver(); 
	}
	
	//Query 실행을 위한 객체를 관리 - BoardMapper 등록
	@Bean
	public MapperFactoryBean<BoardMapper> getMapperFactoryBean(SqlSessionFactory factory) {
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		
		return factoryBean;
	}
	
	//FaqMapper 등록
	@Bean
	public MapperFactoryBean<FaqMapper> getFaqMapper(SqlSessionFactory factory){
		MapperFactoryBean<FaqMapper> factoryBean = new MapperFactoryBean<FaqMapper>(FaqMapper.class);
				
		factoryBean.setSqlSessionFactory(factory);
				
		return factoryBean;
				
	}
	
	//Query 실행을 위한 객체를 관리(Mapper 관리) -- 공지사항 Mapper등록
	@Bean
	public MapperFactoryBean<ServiceCenterMapper> getServiceCenterMapper(SqlSessionFactory factory){
		MapperFactoryBean<ServiceCenterMapper> factoryBean = new MapperFactoryBean<ServiceCenterMapper>(ServiceCenterMapper.class);
		
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean;
		
	}	
	
	
// 문의하기 Mapper등록	
	@Bean
	public MapperFactoryBean<SiteAskMapper> getSiteAskMapper(SqlSessionFactory factory){
		MapperFactoryBean<SiteAskMapper> factoryBean = new MapperFactoryBean<SiteAskMapper>(SiteAskMapper.class);
		
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean;
		
	}
	
	//학원 문의하기
		@Bean
		public MapperFactoryBean<SiteAcaAskMapper> getSiteAcaAskMapper(SqlSessionFactory factory){
			MapperFactoryBean<SiteAcaAskMapper> factoryBean = new MapperFactoryBean<SiteAcaAskMapper>(SiteAcaAskMapper.class);
			
			factoryBean.setSqlSessionFactory(factory); 
			
			return factoryBean;
		}
		
	// 인터셉터 ( 헤더에있는 로그인 정보를 컨트롤러 전에 주입)
		// 모든 요청 주소는 무조건 인터셉터를 통과하도록 해야 합니다.(/**) 
		
		public void addInterceptors(InterceptorRegistry registry) {
			
			WebMvcConfigurer.super.addInterceptors(registry);	
			
				
			
			//CheckLoginInterceptor 등록 : 정보수정, 로그아웃
			CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginMemberBean, loginAcademyMemberBean);
			
			InterceptorRegistration registration2 = registry.addInterceptor(checkLoginInterceptor);
			
			registration2.addPathPatterns("/**");// 인터셉서 통과하도록 유도
//			registration2.excludePathPatterns("/serviceBoard/noticeBoardList"); // 인터셉터 제외
			
		}
		
		//BlackListMapper 등록
		   @Bean
		   public MapperFactoryBean<BlackListMapper> getBlackListMapper(SqlSessionFactory factory){
		      MapperFactoryBean<BlackListMapper> factoryBean = new MapperFactoryBean<BlackListMapper>(BlackListMapper.class);
		      
		      factoryBean.setSqlSessionFactory(factory); 
		      
		      return factoryBean;
		      
		   } 

		 //payMapper등록
		  	@Bean
			public MapperFactoryBean<PayMapper> getPayMapper(SqlSessionFactory factory) {
				MapperFactoryBean<PayMapper> factoryBean = new MapperFactoryBean<PayMapper>(PayMapper.class);

				factoryBean.setSqlSessionFactory(factory);

				return factoryBean;

			}
}












