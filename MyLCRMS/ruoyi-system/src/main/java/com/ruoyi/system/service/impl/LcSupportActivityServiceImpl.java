package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LcSupportActivityMapper;
import com.ruoyi.system.domain.LcSupportActivity;
import com.ruoyi.system.service.ILcSupportActivityService;
// ==================== 新增 import 开始 ====================
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.common.utils.StringUtils;
// ==================== 新增 import 结束 ====================

/**
 * 关爱活动Service业务层处理
 *
 * @author PoChi
 * @date 2025-04-06
 */
@Service
public class LcSupportActivityServiceImpl implements ILcSupportActivityService
{
    @Autowired
    private LcSupportActivityMapper lcSupportActivityMapper;

    // ==================== 新增注入 开始 ====================
    @Autowired
    private ISysUserService userService; // 注入用户服务
    // ==================== 新增注入 结束 ====================


    /**
     * 查询关爱活动
     *
     * @param activityId 关爱活动主键
     * @return 关爱活动
     */
    @Override
    public LcSupportActivity selectLcSupportActivityByActivityId(Long activityId)
    {
        // 如果需要在这里也显示最新的负责人姓名，可以添加关联查询逻辑
        // LcSupportActivity activity = lcSupportActivityMapper.selectLcSupportActivityByActivityId(activityId);
        // if (activity != null && activity.getOrganizerUserId() != null) {
        //     SysUser user = userService.selectUserById(activity.getOrganizerUserId());
        //     if (user != null) {
        //         activity.setOrganizerName(user.getNickName()); // 或者使用 organizerUserName 备用字段
        //     }
        // }
        // return activity;
        // 暂时保持简单，依赖冗余字段
        return lcSupportActivityMapper.selectLcSupportActivityByActivityId(activityId);
    }

    /**
     * 查询关爱活动列表
     *
     * @param lcSupportActivity 关爱活动
     * @return 关爱活动
     */
    @Override
    public List<LcSupportActivity> selectLcSupportActivityList(LcSupportActivity lcSupportActivity)
    {
        // 列表查询直接依赖 organizer_name 冗余字段，或者修改 Mapper XML 进行 JOIN 查询
        return lcSupportActivityMapper.selectLcSupportActivityList(lcSupportActivity);
    }

    /**
     * 新增关爱活动
     *
     * @param lcSupportActivity 关爱活动
     * @return 结果
     */
    @Override
    public int insertLcSupportActivity(LcSupportActivity lcSupportActivity)
    {
        lcSupportActivity.setCreateTime(DateUtils.getNowDate());
        // ==================== 新增逻辑 开始: 填充负责人姓名 ====================
        // 只有在 organizerName 为空时才填充，允许用户手动输入或修改
        if (lcSupportActivity.getOrganizerUserId() != null && StringUtils.isEmpty(lcSupportActivity.getOrganizerName())) {
            SysUser user = userService.selectUserById(lcSupportActivity.getOrganizerUserId());
            if (user != null) {
                lcSupportActivity.setOrganizerName(user.getNickName());
            }
        }
        // ==================== 新增逻辑 结束 ====================
        return lcSupportActivityMapper.insertLcSupportActivity(lcSupportActivity);
    }

    /**
     * 修改关爱活动
     *
     * @param lcSupportActivity 关爱活动
     * @return 结果
     */
    @Override
    public int updateLcSupportActivity(LcSupportActivity lcSupportActivity)
    {
        lcSupportActivity.setUpdateTime(DateUtils.getNowDate());
        // ==================== 新增逻辑 开始: 填充负责人姓名 ====================
        // 根据 organizerUserId 更新 organizerName，如果 ID 存在
        if (lcSupportActivity.getOrganizerUserId() != null) {
            SysUser user = userService.selectUserById(lcSupportActivity.getOrganizerUserId());
            if (user != null) {
                // 如果用户手动修改了 organizerName，是否要覆盖？这里选择覆盖
                lcSupportActivity.setOrganizerName(user.getNickName());
            } else {
                // 如果根据新 ID 找不到用户，清空 organizerName
                lcSupportActivity.setOrganizerName(null);
            }
        } else {
            // 如果 organizerUserId 被清空了，也清空 organizerName
            lcSupportActivity.setOrganizerName(null);
        }
        // ==================== 新增逻辑 结束 ====================
        return lcSupportActivityMapper.updateLcSupportActivity(lcSupportActivity);
    }

    /**
     * 批量删除关爱活动
     *
     * @param activityIds 需要删除的关爱活动主键
     * @return 结果
     */
    @Override
    public int deleteLcSupportActivityByActivityIds(Long[] activityIds)
    {
        return lcSupportActivityMapper.deleteLcSupportActivityByActivityIds(activityIds);
    }

    /**
     * 删除关爱活动信息
     *
     * @param activityId 关爱活动主键
     * @return 结果
     */
    @Override
    public int deleteLcSupportActivityByActivityId(Long activityId)
    {
        return lcSupportActivityMapper.deleteLcSupportActivityByActivityId(activityId);
    }
}