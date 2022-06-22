package com.callor.school.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.school.config.DietConfig;
import com.callor.school.config.QualifierConfig;
import com.callor.school.model.BreathVO;
import com.callor.school.model.DayHealthVO;
import com.callor.school.model.DaySetVO;
import com.callor.school.model.ExpVO;
import com.callor.school.model.GuidVO;
import com.callor.school.model.NotionVO;
import com.callor.school.model.UserVO;
import com.callor.school.model.WorkOutDTO;
import com.callor.school.pesistance.NotionDao;
import com.callor.school.service.BreathService;
import com.callor.school.service.DayHealthService;
import com.callor.school.service.DaySetService;
import com.callor.school.service.ExpService;
import com.callor.school.service.GuidService;
import com.callor.school.service.NotionService;
import com.callor.school.service.SelfitService;
import com.callor.school.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private GuidService guidService;
	@Autowired
	private ExpService expService;
	@Autowired
	private BreathService breathService; 
	@Autowired
	private DayHealthService dayhealthService; 
	@Autowired
	private NotionDao notionDao;
	@Autowired
	private NotionService notionService;
	@Autowired
	private DaySetService daysetService;
	@Autowired
	private UserService userService;

	private SelfitService selfitService;
	public UserController(@Qualifier(QualifierConfig.SERVICE.SELFIT_V2) SelfitService selfitService) {
		this.selfitService = selfitService;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return null;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO userVO, HttpSession session, Model model) {
		String loginMessage = null;
		UserVO loginUserVO = userService.findById(userVO.getUsername());
		UserVO loginUser = (UserVO) session.getAttribute("USER");
		if (loginUserVO == null) {
			loginMessage = "USERNAME FAIL";
		} else // else if
		if (!loginUserVO.getPassword().equals(userVO.getPassword())) {
			loginMessage = "PASSWORD FAIL";
		}
		if (loginMessage == null) {
			session.setAttribute("USER", loginUserVO);
		} else {
			session.removeAttribute("USER");
		}
		model.addAttribute("LOGIN_MESSAGE", loginMessage);
		return "user/login_ok";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("USER");
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return null;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO userVO) {
		userService.join(userVO);
		return "redirect:/user/login";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck/{username:.+}", method = RequestMethod.GET)
	public String idcheck(@PathVariable String username) {

		UserVO userVO = userService.findById(username);
		if (userVO == null) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	@RequestMapping(value = "/login_ok", method = RequestMethod.GET)
	public String login_ok() {
		return null;
	}

	@RequestMapping(value = "/timer", method = RequestMethod.GET)
	public String timer() {
		return null;
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model, String id) {

		UserVO userVO = (UserVO) session.getAttribute("USER");
		if (userVO == null) {
			return "redirect:/user/login";
		}
		
		List<DaySetVO> daysetvo = daysetService.findByUsername(userVO.getUsername());
		model.addAttribute("USERS" ,daysetvo);

		// 다이어트 문구 입력하는 코드
		int length = DietConfig.MESSAGE.length;
		int rndNum = (int) (Math.random() * length);
		String msg = DietConfig.MESSAGE[rndNum];
		model.addAttribute("MESSAGE", msg);

		return null;
	}
	
	@RequestMapping(value="/dayset/{sc_num}",method = RequestMethod.GET)
	public String daySet(@PathVariable("sc_num") String sc_num, Model model) {
		selfitService.getDaySetList(model,sc_num);
		return "/user/dayset";
	}
	
	@RequestMapping(value="/dayset/{sc_num}/{sc_id}",method = RequestMethod.GET)
	public String daySet(
				@PathVariable("sc_num") String sc_num, 
				@PathVariable("sc_id") String sc_id, 
				Model model) {
		selfitService.getDaySetList(model,sc_num,sc_id);
		return "/user/dayset";
	}

	/*
	   @RequestMapping(value = "/dayHealth", method = RequestMethod.GET)
	   public String dayHealth(HttpSession session) {
	      return null;
	   }
	 */
	
	   @RequestMapping(value = "/dayHealth", method = RequestMethod.POST)
	   public String dayHealth(HttpSession session, DayHealthVO dayhealthVO,
	         String sc_id, String sl_listid,Model model) {
	      UserVO userVO = (UserVO) session.getAttribute("USER");
	      int ret = dayhealthService.insert(dayhealthVO,userVO);
	      
	      return String.format("redirect:/user/dayHealth/%s/%s",sc_id,sl_listid) ;
	   }

	@RequestMapping(value="/dayHealth/{sc_id}/{list_id}")
	public String dayHealth(HttpSession session,
							@PathVariable("list_id") String listid,
							@PathVariable("sc_id") String sc_id,
							Model model) {
		UserVO userVO = (UserVO) session.getAttribute("USER");
		
		WorkOutDTO health= selfitService.getDayHealth(sc_id, listid);
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		 List<GuidVO> GVO = guidService.getGuid(listid);
		 List<ExpVO> EXP = expService.getExp(listid);
		 List<BreathVO> BRE = breathService.getBreath(listid);

		 List<DayHealthVO> dayList = dayhealthService.findByUsersDate(userVO.getUsername(),dayFormat.format(date));
		 log.debug("========================");
		 log.debug(dayList.toString());
		 log.debug("========================");
		 model.addAttribute("LIST_NAME",dayList);
		 model.addAttribute("HEALTH", health); 
		 model.addAttribute("GUID", GVO);
		 model.addAttribute("EXP", EXP); 
		 model.addAttribute("BRE", BRE); 

		model.addAttribute("HEALTH", health); 
		
		return "user/dayHealth";
	}
	@RequestMapping(value="/notion", method=RequestMethod.GET)
	public String write(Model model) {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		
		NotionVO notionVO = NotionVO.builder().no_date(dayFormat.format(date))
									.no_time(timeFormat.format(date))
									.no_writer("")
									.build();
		model.addAttribute("NOTION", notionVO);
		return "user/notion";
	}
	
	  @RequestMapping(value="/notion", method=RequestMethod.POST) 
	  public String write(NotionVO notionVO) { 
		  log.debug("=".repeat(100));
		  log.debug("INSERT 전 {}", notionVO.getNo_seq()); 
		  notionDao.insert(notionVO);
		  log.debug("INSERT 후 {}", notionVO.getNo_seq()); 
		  return "redirect:/user/notionList"; 
	  }
	 
		@RequestMapping(value="/notionList", method = RequestMethod.GET)
		public String List(Model model) {
			
			List<NotionVO> notionList = notionService.selectAll();
			model.addAttribute("NOTIONLIST", notionList);
			return "user/notionList";
		}
		@RequestMapping(value = "/calender", method = RequestMethod.GET)
		public String home(Model model) {

			selfitService.startPage(model);
			log.debug((String) model.getAttribute("BEGIN_MENU").toString());

			int length = DietConfig.MESSAGE.length;

			int rndNum = (int)(Math.random() * length);

			String msg = DietConfig.MESSAGE[rndNum];

			model.addAttribute("MESSAGE", msg);

			return "user/calender";
		}

		
		public String guest() {
			return null;
		}
}
