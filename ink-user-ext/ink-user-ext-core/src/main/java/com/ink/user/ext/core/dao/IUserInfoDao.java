/**    
 * <p> Copyright (c) 2015-2025 银客网.</p>
 * <p>All Rights Reserved. 保留所有权利. </p>
 */
package com.ink.user.ext.core.dao;

import com.ink.user.ext.core.po.UserInfo;
import com.ink.base.EntityDao;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
 

public interface IUserInfoDao extends EntityDao<UserInfo, Long>{
	
	public UserInfo getUserInfoByCustIdMchId(Long custId, Long mchId);

}