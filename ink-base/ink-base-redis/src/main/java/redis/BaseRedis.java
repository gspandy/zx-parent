package redis;

import com.ink.base.page.Page;
import consts.RedisConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import redis.clients.jedis.*;
import redis.clients.util.SafeEncoder;
import util.CacheTypeUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * redis缓存基础服务类（提供操作redis的基础服务）
 * 
 * @author wangxk
 * @create 2016-2-22 下午11:11:06
 * @version cache 2.0
 */
@Service
public class BaseRedis {

	private static Logger logger = LoggerFactory.getLogger(BaseRedis.class);

	private final CacheTypeUtil cacheTypeUtil = new CacheTypeUtil();

	@Resource(name="shardedJedisPool")
	private ShardedJedisPool shardedJedisPool;

	@Resource(name="jedisPool")
	private JedisPool JedisPool;

	/**
	 * 缓存对象(新增和修改)
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param id
	 *            缓存对象Id
	 * @param object
	 *            缓存对象
	 * @return 成功：true；失败：false
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午4:12:34
	 * @version cache 2.0
	 */
	@SuppressWarnings("unchecked")
	public boolean cacheObject(String key, Object id, Object object) {
		List<Object> list = new ArrayList<Object>();
		Jedis jedis = JedisPool.getResource();
		boolean result = false;
		try {
			Transaction trans = jedis.multi();
			if (object instanceof Map) {
				trans.hmset(
						key + RedisConstant.KEY_RECORD + id,
						CacheTypeUtil
								.convertObjectMapToStringMap((Map<String, Object>) object));
			} else {
				trans.hmset(key + RedisConstant.KEY_RECORD + id,
						CacheTypeUtil.convertObjToHashMap(object));
			}
			list = trans.exec();
			if (list != null) {
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			logger.error("缓存对象出现异常", e);
			result = false;
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 缓存对象（排序）
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param id
	 *            缓存对象Id
	 * @param object
	 *            缓存对象
	 * @param score
	 *            排序分值，分数越大，越靠前
	 * @param expiredTime
	 *            失效时间 0或者null代表永不失效
	 * @return
	 * 
	 * @author wangxk
	 * @create 2015-6-10 下午5:59:09
	 * @version cache 2.0
	 */
	@SuppressWarnings("unchecked")
	public boolean cacheObjectWithSort(String key, Object id, Object object,
			double score, Integer expiredTime) {
		List<Object> list = new ArrayList<Object>();
		Jedis jedis = JedisPool.getResource();
		boolean result = false;
		try {
			Transaction trans = jedis.multi();
			if (object instanceof Map) {
				trans.hmset(
						key + RedisConstant.KEY_RECORD + id,
						CacheTypeUtil
								.convertObjectMapToStringMap((Map<String, Object>) object));
			} else {
				trans.hmset(key + RedisConstant.KEY_RECORD + id,
						CacheTypeUtil.convertObjToHashMap(object));
			}
			trans.zadd(key + RedisConstant.KEY_ACTIVE_LIST, score,
					id.toString());
			if (expiredTime != null && expiredTime > 0) {
				trans.expire(key + RedisConstant.KEY_RECORD + id, expiredTime);
			}
			list = trans.exec();
			if (list != null) {
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			logger.error("缓存对象出现异常", e);
			result = false;
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 删除缓存对象
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param id
	 *            缓存对象Id
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午11:07:53
	 * @version cache 2.0
	 */
	public boolean deleteObject(String key, Object id) {
		List<Object> list = new ArrayList<Object>();
		Jedis jedis = JedisPool.getResource();
		boolean result = false;
		try {
			Transaction trans = jedis.multi();
			trans.zrem(key + RedisConstant.KEY_ACTIVE_LIST, id.toString());
			trans.del(key + RedisConstant.KEY_RECORD + id.toString());
			list = trans.exec();
			if (list != null) {
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			logger.error("缓存删除对象异常", e);
			result = false;
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 获取缓存对象
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param id
	 *            缓存对象Id
	 * @param obj
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午11:06:36
	 * @version cache 2.0
	 */
	public Object getObject(String key, Object id, Class<?> obj) {
		Object result = null;
		Jedis jedis = JedisPool.getResource();
		try {
			Map<String, String> map = jedis.hgetAll(key
					+ RedisConstant.KEY_RECORD + id);
			if (obj.equals(Map.class)) {
				result = CacheTypeUtil.convertStringMapToObjectMap(map);
			} else {
				result = CacheTypeUtil.convertMapToObject(map, obj);
			}
		} catch (Exception e) {
			logger.error("缓存获取对象异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 获取缓存最新记录
	 * 
	 * @param key
	 * @param obj
	 * @return
	 */
	public Object getLatestObject(String key, Class<?> obj) {
		Object result = null;
		Jedis jedis = JedisPool.getResource();
		Set<String> idSet = jedis.zrevrange(
				key + RedisConstant.KEY_ACTIVE_LIST, 0, 0);
		String latestd = "";
		for (String id : idSet) {
			latestd = id;
		}
		try {
			Map<String, String> map = jedis.hgetAll(key
					+ RedisConstant.KEY_RECORD + latestd);
			if (obj.equals(Map.class)) {
				result = CacheTypeUtil.convertStringMapToObjectMap(map);
			} else {
				result = CacheTypeUtil.convertMapToObject(map, obj);
			}
		} catch (Exception e) {
			logger.error("缓存获取对象异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 清空缓存
	 * 
	 * @param key
	 *            缓存服务标志
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午11:06:23
	 * @version cache 2.0
	 */
	public boolean flushCache(String key) {
		Jedis jedis = JedisPool.getResource();
		boolean result = false;
		try {
			Set<String> keys = jedis.keys(key + "*");
			Object[] objectArray = keys.toArray();
			String[] keyArray = new String[keys.size()];
			for (int i = 0; i < objectArray.length; i++)
				keyArray[i] = objectArray[i].toString();

			Long flag = (long) 0;
			if (keyArray.length > 0) {
				flag = jedis.del(keyArray);
			}
			if (flag != null) {
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			logger.error("缓存清空出现异常", e);
			result = false;
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 判断记录是否存在
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param id
	 *            缓存对象Id
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午11:05:22
	 * @version cache 2.0
	 */
	public boolean isRecordExits(String key, Object id) {
		Jedis jedis = JedisPool.getResource();
		boolean result = false;
		try {
			result = jedis.exists(key + RedisConstant.KEY_RECORD + id);
		} catch (Exception e) {
			logger.error("判断缓存是否存在出现异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return result;
	}

	/**
	 * 分页获取记录
	 * 
	 * @param key
	 *            缓存服务标志
	 * @param page
	 *            分页对象
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午10:55:50
	 * @version cache 2.0
	 */
	@SuppressWarnings("unchecked")
	public <T> Page getObjectByPage(String key, Page<T> page) {
		Jedis jedis = JedisPool.getResource();
		try {
			int pageNo = page.getThisPageNumber();
			if (pageNo <= 0) {
				pageNo = 1;
			}
			int pageSize = page.getPageSize();
			int start = (pageNo - 1) * pageSize;
			int end = pageNo * pageSize - 1;
			Set<String> idSet = jedis.zrevrange(key
					+ RedisConstant.KEY_ACTIVE_LIST, start, end);
			if (idSet == null || idSet.isEmpty()) {
				return page;
			}
			// 取出所有记录
			Transaction trans = jedis.multi();
			for (String cacheId : idSet) {
				trans.hgetAll(key + RedisConstant.KEY_RECORD + cacheId);
			}
			List<T> transResult = (List<T>) trans.exec();
			if ((transResult == null || transResult.isEmpty())) {
				return page;
			}

			if (page.getTotalCount() <= 0 && page.getPageSize() > 0) {
				// 获取记录数
				int count = this.getCacheCount(key);
				page.setTotalCount(count);
			}
			page.setResult(transResult);

		} catch (Exception e) {
			logger.error("分页获取缓存记录异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return page;
	}

	/**
	 * 从指定Id值开始获取分页数据（APP客户端使用）
	 * 
	 * @param key
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> Page getObjectByPageWithStartId(String key, Page<T> page) {
		Jedis jedis = JedisPool.getResource();
		try {

			int startId = page.getThisPageNumber();
			long start = 0;

			Set<String> lastId = jedis.zrevrange(key
					+ RedisConstant.KEY_ACTIVE_LIST, -1, -1);
			for (String id : lastId) {
				// 设置总条数， page.getLastPageNumber() 获取总页数
				page.setTotalCount(Integer.parseInt(id) * page.getPageSize());
			}

			if (startId > 0) {
				if ((startId > 0 && startId > page.getLastPageNumber())) {
					// 获取指定key值起始位置
					start = jedis.zrevrank(key + RedisConstant.KEY_ACTIVE_LIST,
							startId + "") + 1;
				} else if (startId > 0 && startId <= page.getLastPageNumber()) {
					return page;
				}
			}

			long end = start + page.getPageSize() - 1;
			Set<String> idSet = jedis.zrevrange(key
					+ RedisConstant.KEY_ACTIVE_LIST, start, end);
			if (idSet == null || idSet.isEmpty()) {
				return page;
			}

			// 取出所有记录
			Transaction trans = jedis.multi();
			for (String cacheId : idSet) {
				trans.hgetAll(key + RedisConstant.KEY_RECORD + cacheId);
			}
			List<T> transResult = (List<T>) trans.exec();
			if ((transResult == null || transResult.isEmpty())) {
				return page;
			}
			page.setResult(transResult);
		} catch (Exception e) {
			logger.error("分页获取缓存记录异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return page;
	}

	/**
	 * 获取总记录数
	 * 
	 * @param key
	 * @return
	 * 
	 * @author wangxk
	 * @create 2016-2-22 下午10:55:30
	 * @version cache 2.0
	 */
	public int getCacheCount(String key) {
		Jedis jedis = JedisPool.getResource();
		int count = 0;
		try {
			Set<String> activeSet = jedis.zrange(key
					+ RedisConstant.KEY_ACTIVE_LIST, 0, -1);
			if (activeSet != null) {
				count = activeSet.size();
			}
		} catch (Exception e) {
			logger.error("获取缓存记录数异常", e);
		} finally {
			if (jedis != null) {
				JedisPool.returnResource(jedis);
			}
		}
		return count;
	}

	/**
	 * 缓存
	 * 
	 * @param key
	 * @param value
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:55:25
	 * @version cache 2.0
	 */
	public boolean setCache(String key, Object value) throws Exception {
		return setByRedis(key, value, 0);
	}

	/**
	 * 缓存并指定失效时间
	 * 
	 * @param key
	 * @param value
	 * @param expiredTime
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:54:55
	 * @version cache 2.0
	 */
	public boolean setCache(String key, Object value, Integer expiredTime)
			throws Exception {
		return setByRedis(key, value, expiredTime);
	}

	/**
	 * 缓存获取指定key值数据
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:54:36
	 * @version cache 2.0
	 */
	public Object getCache(String key) throws Exception {
		Object result = getByRedis(key);
		return result;
	}

	/**
	 * 缓存删除指定key
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:54:23
	 * @version cache 2.0
	 */
	public boolean remove(String key) throws Exception {
		return deleteByRedis(key);
	}

	/**
	 * 缓存删除
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:54:07
	 * @version cache 2.0
	 */
	private boolean deleteByRedis(String key) throws Exception {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		boolean tag = false;
		try {
			Long delStatus = jedis.del(RedisConstant.KEY_KEYVALUE + key);
			if (delStatus == 1) {
				tag = true;
			}
		} catch (Exception e) {
			tag = false;
			throw new Exception("缓存删除key(" + key + ")异常："
					+ e.getLocalizedMessage(), e);
		} finally {
			if (jedis != null) {
				this.shardedJedisPool.returnResource(jedis);
			}
		}
		return tag;
	}

	/**
	 * 缓存获取数据
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:53:46
	 * @version cache 2.0
	 */
	private Object getByRedis(String key) throws Exception {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		Object obj = null;
		try {
			byte[] bytes = jedis.get(SafeEncoder.encode(key));
			obj = cacheTypeUtil.bytesToObject(bytes);
		} catch (Exception e) {
			throw new Exception("缓存获取key(" + key + ")异常："
					+ e.getLocalizedMessage(), e);
		} finally {
			if (jedis != null) {
				this.shardedJedisPool.returnResource(jedis);
			}
		}
		return obj;
	}

	/**
	 * 缓存数据
	 * 
	 * @param key
	 * @param value
	 * @param expiredTime
	 * @return
	 * @throws Exception
	 * 
	 * @author wangxk
	 * @create 2015-6-17 下午2:53:25
	 * @version cache 2.0
	 */
	private boolean setByRedis(String key, Object value, Integer expiredTime)
			throws Exception {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		boolean tag = false;
		try {
			String saveStatus = jedis.set(SafeEncoder.encode(key),
					cacheTypeUtil.objectToBytes(value));
			if (expiredTime != null && expiredTime > 0) {
				jedis.expire(SafeEncoder.encode(key), expiredTime);
			}
			if ("OK".equals(saveStatus)) {
				tag = true;
			}
		} catch (Exception e) {
			tag = false;
			throw new Exception("缓存保存key(" + key + ")异常："
					+ e.getLocalizedMessage(), e);
		} finally {
			if (jedis != null) {
				this.shardedJedisPool.returnResource(jedis);
			}
		}
		return tag;
	}

	/**
	 * 在有序集合中添加一个元素
	 */
	public void zadd(String key, double score, String value) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			jedis.zadd(key, score, value);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zadd " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
	}

	/**
	 * 增加有序集合某个值得权重
	 */
	public double zincrby(String key, double score, String value) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.zincrby(key, score, value);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zincrby " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 从小到大排序
	 */
	public Set<String> zrange(String key, int start, int end) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Set<String> set = jedis.zrange(key, start, end);
			return set;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zrange " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return null;
	}

	/**
	 * 从大到小排序
	 */
	public Set<String> zrevrange(String key, int start, int end) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.zrevrange(key, start, end);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zrevrange " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return null;
	}

	/**
	 * 返回有序集合中某个值得排名（从大到小）
	 */
	public long zrevrank(String key, String member) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.zrevrank(key, member);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zrevrank " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 返回队列的成员总数
	 */
	public long zcard(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.zcard(key);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.scard " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 根据排名移除队列(从小到大)
	 * 
	 * @param key
	 *            -- KEY
	 * @param start
	 *            -- 起始排名
	 * @param end
	 *            -- 截止排名
	 * @return
	 */
	public long zremrangeByRank(String key, int start, int end) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.zremrangeByRank(key, start, end);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zremrangeByRank "
					+ e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 获取集合中某个成员的得分
	 * 
	 * @param key
	 *            -- KEY
	 * @param member
	 *            -- 成员
	 * @return
	 */
	public double zscore(String key, String member) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.zscore(key, member);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.zscore " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 将某个都想插入队列的表头
	 * 
	 * @param key
	 *            -- KEY
	 * @param value
	 *            -- 对象
	 * @return
	 */
	public long lpush(String key, Object value) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.lpush(SafeEncoder.encode(key),
					cacheTypeUtil.objectToBytes(value));
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.lpush " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 将某个都想插入队列的表尾
	 * 
	 * @param key
	 *            -- KEY
	 * @param value
	 *            -- 对象
	 * @return
	 */
	public long rpush(String key, Object value) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.rpush(SafeEncoder.encode(key),
					cacheTypeUtil.objectToBytes(value));
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.lpush " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 移除并返回存于 key 的 list 的最后一个元素，即删除队尾元素并返回该元素
	 * 
	 * @param key
	 * @return
	 */
	public Object rpop(String key) {
		ShardedJedis jedis = (ShardedJedis) shardedJedisPool.getResource();
		Object obj = null;
		try {
			byte[] bytes = jedis.rpop(SafeEncoder.encode(key));
			obj = cacheTypeUtil.bytesToObject(bytes);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.rpop " + e.getLocalizedMessage());
		} finally {
			if (jedis != null) {
				this.shardedJedisPool.returnResource(jedis);
			}
		}
		return obj;
	}

	/**
	 * 获取指定区间的元素
	 * 
	 * @param key
	 *            -- KEY
	 * @param start
	 *            -- 开始下标
	 * @param end
	 *            -- 结束下标
	 * @return
	 */
	public List lrange(String key, int start, int end) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			List<byte[]> list = jedis.lrange(SafeEncoder.encode(key), start,
					end);
			List l = new ArrayList<>();
			for (byte[] bytes : list) {
				l.add(cacheTypeUtil.bytesToObject(bytes));
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.lrange " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return null;
	}

	/**
	 * 将元素添加到set集合中
	 */
	public long sadd(String key, String member) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.sadd(key, member);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.lrange " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 使用管道将元素添加到set集合中
	 */
	public long saddUsePipeline(String key, List<String> list) {
		Response<Long> l = null;
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			ShardedJedisPipeline pl = jedis.pipelined();
			for (String str : list) {
				l = pl.sadd(key, str);
			}
			pl.sync();
			Long num = l.get().longValue();
			if (num == null) {
				return -1;
			}
			return num;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.lrange saddUsePipeline"
					+ e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 
	 */
	public Long sdiffStore(String result, String setA, String setB) {
		Jedis jedis = JedisPool.getResource();
		try {
			Long l = jedis.sdiffstore(result, setA, setB);
			return l;
		} catch (Exception e) {
			logger.error("[ERROR]sdiffStore Cache.scard "
					+ e.getLocalizedMessage());
		} finally {
			JedisPool.returnResource(jedis);
		}
		return null;
	}

	/**
	 * 判断元素是否在set集合内
	 */
	public boolean sismember(String key, String member) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.sismember(key, member);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.sismember " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return false;
	}

	/**
	 * 获取set集合内元素的数量
	 */
	public long scard(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.scard(key);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.scard " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 获取set集合中的所有元素
	 */
	public Set<String> smembers(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.smembers(key);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.scard " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return null;
	}

	/**
	 * 将元素从set集合中移除。返回新的集合大小
	 */
	public long smove(String key, String member) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			Long l = jedis.srem(key, member);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.scard " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 删除缓存
	 */
	public long del(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			jedis.expire(key, 1);
			Long l = jedis.del(key);
			if (l == null) {
				return -1;
			}
			return l;
		} catch (Exception e) {
			logger.error("[ERROR] Cache.del " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return 0;
	}

	/**
	 * 计数器
	 */
	public long incr(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.incr(key);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.incr " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 自定义步数计数器
	 */
	public long incrBy(String key, int step) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.incrBy(key, step);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.incr " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 设置超时时间
	 * 
	 * @param key
	 *            -- KEY
	 * @param seconds
	 *            -- 秒数
	 * @return
	 */
	public long expire(String key, int seconds) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.expire(key, seconds);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.incr " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return -1;
	}

	/**
	 * 判断key是否存在
	 */
	public boolean exists(String key) {
		ShardedJedis jedis = (ShardedJedis) this.shardedJedisPool.getResource();
		try {
			return jedis.exists(key);
		} catch (Exception e) {
			logger.error("[ERROR] Cache.exists " + e.getLocalizedMessage());
		} finally {
			this.shardedJedisPool.returnResource(jedis);
		}
		return false;
	}
}
