package kr.co.Controller;

import javax.inject.Inject;
import kr.co.Service.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MasterDetailController {
	
	@RequestMapping(value = "/grid", method = RequestMethod.GET)
	public String grid() {
		return "grid";
	}
}
