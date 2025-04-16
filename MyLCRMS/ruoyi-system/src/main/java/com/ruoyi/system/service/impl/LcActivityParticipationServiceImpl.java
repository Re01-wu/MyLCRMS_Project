package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LcActivityParticipationMapper;
import com.ruoyi.system.domain.LcActivityParticipation;
import com.ruoyi.system.service.ILcActivityParticipationService;

/**
 * 活动参与记录Service业务层处理
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@Service
public class LcActivityParticipationServiceImpl implements ILcActivityParticipationService 
{
    @Autowired
    private LcActivityParticipationMapper lcActivityParticipationMapper;

    /**
     * 查询活动参与记录
     * 
     * @param participationId 活动参与记录主键
     * @return 活动参与记录
     */
    @Override
    public LcActivityParticipation selectLcActivityParticipationByParticipationId(Long participationId)
    {
        return lcActivityParticipationMapper.selectLcActivityParticipationByParticipationId(participationId);
    }

    /**
     * 查询活动参与记录列表
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 活动参与记录
     */
    @Override
    public List<LcActivityParticipation> selectLcActivityParticipationList(LcActivityParticipation lcActivityParticipation)
    {
        return lcActivityParticipationMapper.selectLcActivityParticipationList(lcActivityParticipation);
    }

    /**
     * 新增活动参与记录
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 结果
     */
    @Override
    public int insertLcActivityParticipation(LcActivityParticipation lcActivityParticipation)
    {
        lcActivityParticipation.setCreateTime(DateUtils.getNowDate());
        return lcActivityParticipationMapper.insertLcActivityParticipation(lcActivityParticipation);
    }

    /**
     * 修改活动参与记录
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 结果
     */
    @Override
    public int updateLcActivityParticipation(LcActivityParticipation lcActivityParticipation)
    {
        lcActivityParticipation.setUpdateTime(DateUtils.getNowDate());
        return lcActivityParticipationMapper.updateLcActivityParticipation(lcActivityParticipation);
    }

    /**
     * 批量删除活动参与记录
     * 
     * @param participationIds 需要删除的活动参与记录主键
     * @return 结果
     */
    @Override
    public int deleteLcActivityParticipationByParticipationIds(Long[] participationIds)
    {
        return lcActivityParticipationMapper.deleteLcActivityParticipationByParticipationIds(participationIds);
    }

    /**
     * 删除活动参与记录信息
     * 
     * @param participationId 活动参与记录主键
     * @return 结果
     */
    @Override
    public int deleteLcActivityParticipationByParticipationId(Long participationId)
    {
        return lcActivityParticipationMapper.deleteLcActivityParticipationByParticipationId(participationId);
    }
}
