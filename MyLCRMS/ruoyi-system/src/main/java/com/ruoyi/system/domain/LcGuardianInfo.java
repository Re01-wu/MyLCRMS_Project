package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 监护人信息对象 lc_guardian_info
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public class LcGuardianInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 监护人ID (主键) */
    private Long guardianId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 与儿童关系 (如 祖父, 外婆, 叔叔) */
    @Excel(name = "与儿童关系 (如 祖父, 外婆, 叔叔)")
    private String relationship;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 当前住址 */
    @Excel(name = "当前住址")
    private String address;

    /** 工作情况/外出务工父母信息简述 (可选) */
    private String workInfo;

    public void setGuardianId(Long guardianId) 
    {
        this.guardianId = guardianId;
    }

    public Long getGuardianId() 
    {
        return guardianId;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setRelationship(String relationship) 
    {
        this.relationship = relationship;
    }

    public String getRelationship() 
    {
        return relationship;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setWorkInfo(String workInfo) 
    {
        this.workInfo = workInfo;
    }

    public String getWorkInfo() 
    {
        return workInfo;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("guardianId", getGuardianId())
            .append("name", getName())
            .append("relationship", getRelationship())
            .append("phone", getPhone())
            .append("address", getAddress())
            .append("workInfo", getWorkInfo())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
