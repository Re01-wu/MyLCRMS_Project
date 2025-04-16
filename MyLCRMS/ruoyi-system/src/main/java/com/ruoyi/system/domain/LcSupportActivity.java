package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 关爱活动对象 lc_support_activity
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public class LcSupportActivity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 活动ID */
    private Long activityId;

    /** 活动名称 */
    @Excel(name = "活动名称")
    private String activityName;

    /** 活动时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "活动时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date activityTime;

    /** 活动地点 */
    @Excel(name = "活动地点")
    private String location;

    /** 活动内容描述 */
    private String content;

    /** 负责人用户ID */
    @Excel(name = "负责人用户ID")
    private Long organizerUserId;

    /** 负责人姓名 */
    @Excel(name = "负责人姓名")
    private String organizerName;

    /** 活动状态(0未开始 1进行中 2已结束) */
    @Excel(name = "活动状态(0未开始 1进行中 2已结束)")
    private String status;

    public void setActivityId(Long activityId) 
    {
        this.activityId = activityId;
    }

    public Long getActivityId() 
    {
        return activityId;
    }

    public void setActivityName(String activityName) 
    {
        this.activityName = activityName;
    }

    public String getActivityName() 
    {
        return activityName;
    }

    public void setActivityTime(Date activityTime) 
    {
        this.activityTime = activityTime;
    }

    public Date getActivityTime() 
    {
        return activityTime;
    }

    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setOrganizerUserId(Long organizerUserId) 
    {
        this.organizerUserId = organizerUserId;
    }

    public Long getOrganizerUserId() 
    {
        return organizerUserId;
    }

    public void setOrganizerName(String organizerName) 
    {
        this.organizerName = organizerName;
    }

    public String getOrganizerName() 
    {
        return organizerName;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("activityId", getActivityId())
            .append("activityName", getActivityName())
            .append("activityTime", getActivityTime())
            .append("location", getLocation())
            .append("content", getContent())
            .append("organizerUserId", getOrganizerUserId())
            .append("organizerName", getOrganizerName())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
