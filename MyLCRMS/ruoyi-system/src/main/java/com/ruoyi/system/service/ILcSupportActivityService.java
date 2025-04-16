package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LcSupportActivity;

/**
 * 关爱活动Service接口
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public interface ILcSupportActivityService 
{
    /**
     * 查询关爱活动
     * 
     * @param activityId 关爱活动主键
     * @return 关爱活动
     */
    public LcSupportActivity selectLcSupportActivityByActivityId(Long activityId);

    /**
     * 查询关爱活动列表
     * 
     * @param lcSupportActivity 关爱活动
     * @return 关爱活动集合
     */
    public List<LcSupportActivity> selectLcSupportActivityList(LcSupportActivity lcSupportActivity);

    /**
     * 新增关爱活动
     * 
     * @param lcSupportActivity 关爱活动
     * @return 结果
     */
    public int insertLcSupportActivity(LcSupportActivity lcSupportActivity);

    /**
     * 修改关爱活动
     * 
     * @param lcSupportActivity 关爱活动
     * @return 结果
     */
    public int updateLcSupportActivity(LcSupportActivity lcSupportActivity);

    /**
     * 批量删除关爱活动
     * 
     * @param activityIds 需要删除的关爱活动主键集合
     * @return 结果
     */
    public int deleteLcSupportActivityByActivityIds(Long[] activityIds);

    /**
     * 删除关爱活动信息
     * 
     * @param activityId 关爱活动主键
     * @return 结果
     */
    public int deleteLcSupportActivityByActivityId(Long activityId);
}
