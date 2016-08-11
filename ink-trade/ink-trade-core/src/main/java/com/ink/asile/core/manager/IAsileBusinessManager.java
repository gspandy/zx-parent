/**    
 * <p> Copyright (c) 2015-2025 银客网.</p>
 * <p>All Rights Reserved. 保留所有权利. </p>
 */
package com.ink.asile.core.manager;

import com.ink.asile.core.po.AsileBusiness;
import com.ink.base.IBaseManager;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
 public interface IAsileBusinessManager extends IBaseManager<AsileBusiness, java.lang.Long>{
     boolean IsSynchronized(String asileCode,String businessCode);
     public int updateNotNull(AsileBusiness asileBusiness);
}
