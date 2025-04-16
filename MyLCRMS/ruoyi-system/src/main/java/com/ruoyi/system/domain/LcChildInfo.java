package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;


/**
 * 留守儿童信息对象 lc_child_info
 *
 * @author PoChi
 * @date 2025-04-06
 */
public class LcChildInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 儿童ID (主键) */
    private Long childId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 (0男 1女 2未知 - 对应 sys_user_sex 字典) */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知") // 优化Excel导出显示
    private String gender;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthDate;

    /** 身份证号 (可选, 最好有) */
    @Excel(name = "身份证号")
    private String idCard;

    /** 所在学校 */
    @Excel(name = "所在学校")
    private String school;

    /** 年级 */
    @Excel(name = "年级")
    private String grade;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String homeAddress;

    /** 健康状况简述 */
    // @Excel(name = "健康状况简述") // Excel中通常不需要此长文本
    private String healthStatus;

    /** 主要监护人ID */
    // @Excel(name = "主要监护人ID") // Excel中显示姓名而非ID
    private Long primaryGuardianId;

    // ==================== 新增字段开始 ====================
    /** 主要监护人姓名 (非数据库字段，用于关联查询显示) */
    @Excel(name = "主要监护人姓名") // 在Excel中导出姓名
    private String primaryGuardianName;
    // ==================== 新增字段结束 ====================

    /** 状态 */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用") // 优化Excel导出显示
    private String status;

    // --- 原有的 Getter 和 Setter ---
    public void setChildId(Long childId)
    {
        this.childId = childId;
    }

    public Long getChildId()
    {
        return childId;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getGender()
    {
        return gender;
    }
    public void setBirthDate(Date birthDate)
    {
        this.birthDate = birthDate;
    }

    public Date getBirthDate()
    {
        return birthDate;
    }
    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCard()
    {
        return idCard;
    }
    public void setSchool(String school)
    {
        this.school = school;
    }

    public String getSchool()
    {
        return school;
    }
    public void setGrade(String grade)
    {
        this.grade = grade;
    }

    public String getGrade()
    {
        return grade;
    }
    public void setHomeAddress(String homeAddress)
    {
        this.homeAddress = homeAddress;
    }

    public String getHomeAddress()
    {
        return homeAddress;
    }
    public void setHealthStatus(String healthStatus)
    {
        this.healthStatus = healthStatus;
    }

    public String getHealthStatus()
    {
        return healthStatus;
    }
    public void setPrimaryGuardianId(Long primaryGuardianId)
    {
        this.primaryGuardianId = primaryGuardianId;
    }

    public Long getPrimaryGuardianId()
    {
        return primaryGuardianId;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    // ==================== 新增 Getter 和 Setter 开始 ====================
    public String getPrimaryGuardianName() {
        return primaryGuardianName;
    }

    public void setPrimaryGuardianName(String primaryGuardianName) {
        this.primaryGuardianName = primaryGuardianName;
    }
    // ==================== 新增 Getter 和 Setter 结束 ====================

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("childId", getChildId())
                .append("name", getName())
                .append("gender", getGender())
                .append("birthDate", getBirthDate())
                .append("idCard", getIdCard())
                .append("school", getSchool())
                .append("grade", getGrade())
                .append("homeAddress", getHomeAddress())
                .append("healthStatus", getHealthStatus())
                .append("primaryGuardianId", getPrimaryGuardianId())
                .append("primaryGuardianName", getPrimaryGuardianName()) // 添加到 toString
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}