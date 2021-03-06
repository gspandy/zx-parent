
/**    
 * <p> Copyright (c) 2015-2025 银客网.</p>
 * <p>All Rights Reserved. 保留所有权利. </p>
 */
package com.yinker.scheduler.controller;

import com.ink.scheduler.core.po.TimerTaskJob;
import com.ink.scheduler.core.query.TimerTaskJobQuery;
import com.ink.scheduler.core.service.ITimerTaskJobManager;
import com.ink.scheduler.core.util.TaskJobConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yinker.base.BaseController;
import com.yinker.base.page.Page;

import com.ink.scheduler.core.query.TimerTaskJobLogQuery;
import com.ink.scheduler.core.po.TimerTaskJobLog;
import com.ink.scheduler.core.service.ITimerTaskJobLogManager;

import java.util.List;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
 
@RequestMapping("jobLog")
@Controller
public class TimerTaskJobLogController extends BaseController {
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "jobLog/list";
	protected static final String CREATE_JSP = "jobLog/create";
	protected static final String EDIT_JSP = "jobLog/edit";
	protected static final String SHOW_JSP = "jobLog/show";
	//redirect paths,startWith: !
	
	@Autowired
	private ITimerTaskJobLogManager timerTaskJobLogManager;

	@Autowired
	private ITimerTaskJobManager timerTaskJobManager;
	
	@RequestMapping(value="/list")
	public ModelAndView list() {
		
		TimerTaskJobLogQuery query = newQuery(TimerTaskJobLogQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = timerTaskJobLogManager.findPage(query);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(LIST_JSP);
		modelAndView.addObject("page", page);

		//查询任务列表
		TimerTaskJobQuery queryjob = new TimerTaskJobQuery();
		//只查询status为运行的job
		queryjob.setStatus(TaskJobConstants.STATUS_RUNNING);
		List<TimerTaskJob> jobList = timerTaskJobManager.find(queryjob);
		modelAndView.addObject("jobList", jobList);

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
	public String save(TimerTaskJobLog timerTaskJobLog) {
		timerTaskJobLogManager.save(timerTaskJobLog);
		return writeAjaxResponse("1");
	}
	
	/** 查看对象*/
	@RequestMapping(value="/show")
	public ModelAndView show(TimerTaskJobLog timerTaskJobLog) {
		TimerTaskJobLog model = timerTaskJobLogManager.getById(timerTaskJobLog.getId());
		ModelAndView mav = new ModelAndView(SHOW_JSP);
		mav.addObject("model", model);
		return mav;
	}
	
	/**进入更新页面*/
	@RequestMapping(value="/edit")
	public ModelAndView edit(TimerTaskJobLog timerTaskJobLog) {
		TimerTaskJobLog model = timerTaskJobLogManager.getById(timerTaskJobLog.getId());
		ModelAndView mav = new ModelAndView(EDIT_JSP);
		mav.addObject("model", model);
		return mav;
	}
	
	/**保存更新对象*/
	@RequestMapping(value="/update")
	@ResponseBody
	public String update(TimerTaskJobLog timerTaskJobLog) {
		timerTaskJobLogManager.update(timerTaskJobLog);
		return writeAjaxResponse("1");
	}
	
	
	/**删除对象*/
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(String items) {
		if(items!=null){
			String[] idArray = items.split(",");
			for(String id: idArray){
				timerTaskJobLogManager.removeById(Integer.valueOf(id));
			}
		}
		
		return writeAjaxResponse("1");
	}
}
