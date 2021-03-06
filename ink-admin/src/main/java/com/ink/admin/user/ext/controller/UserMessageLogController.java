
/**    
 * <p> Copyright (c) 2015-2025 银客网.</p>
 * <p>All Rights Reserved. 保留所有权利. </p>
 */
package com.ink.admin.user.ext.controller;

import com.ink.base.BaseController;
import com.ink.base.page.Page;
import com.ink.base.service.DubboBaseService;
import com.ink.user.ext.core.po.UserMessageLog;
import com.ink.user.ext.core.query.UserMessageLogQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
 
@RequestMapping("userext/UserMessageLog")
@Controller
public class UserMessageLogController extends BaseController {
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = " create_time desc"; 
	
	//forward paths
	protected static final String LIST_JSP= "/userext/UserMessageLog/list";
	protected static final String CREATE_JSP = "/userext/UserMessageLog/create";
	protected static final String EDIT_JSP = "/userext/UserMessageLog/edit";
	protected static final String SHOW_JSP = "/userext/UserMessageLog/show";
	//redirect paths,startWith: !

	@Autowired
	private DubboBaseService userextDubboBaseService;
	
	@RequestMapping(value="/list")
	public ModelAndView list() throws Exception {
		
		UserMessageLogQuery query = newQuery(UserMessageLogQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = userextDubboBaseService.findPage("userMessageLogManager",query);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(LIST_JSP);
		modelAndView.addObject("page", page);
		
		return modelAndView;
	}
	
	/** 进入新增页面*/
	@RequestMapping(value="/create")
	public ModelAndView create() {
		return new ModelAndView(CREATE_JSP);
	}
	
	/** 保存新增对象 */
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(UserMessageLog userMessageLog) throws Exception {
		userextDubboBaseService.save("userMessageLogManager", userMessageLog);
		return writeAjaxResponse("1");
	}
	
	/** 查看对象*/
	@RequestMapping(value="/show")
	public ModelAndView show(UserMessageLog userMessageLog) throws Exception {
		UserMessageLog model = (UserMessageLog) userextDubboBaseService.getById("userMessageLogManager",userMessageLog.getId());
		ModelAndView mav = new ModelAndView(SHOW_JSP);
		mav.addObject("model", model);
		return mav;
	}
	
	/**进入更新页面*/
	@RequestMapping(value="/edit")
	public ModelAndView edit(UserMessageLog userMessageLog) throws Exception {
		UserMessageLog model = (UserMessageLog) userextDubboBaseService.getById("userMessageLogManager",userMessageLog.getId());
		ModelAndView mav = new ModelAndView(EDIT_JSP);
		mav.addObject("model", model);
		return mav;
	}
	
	/**保存更新对象*/
	@RequestMapping(value="/update")
	@ResponseBody
	public String update(UserMessageLog userMessageLog) throws Exception {
		userextDubboBaseService.update("userMessageLogManager", userMessageLog);
		return writeAjaxResponse("1");
	}
	
	
	/**删除对象*/
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(String items) {
		if(items!=null){
			String[] idArray = items.split(",");
			for(String id: idArray){
				//userMessageLogManager.getById(Long.valueOf(id));
				//userMessageLogManager.removeById(Long.valueOf(id));
			}
		}
		
		return writeAjaxResponse("1");
	}
}
