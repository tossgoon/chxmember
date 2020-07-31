package com.chx.model;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class ChxMem {
  private Integer memId;
  private String cardId;
  private String memName;
  private String kindName;
  private String sex;
  private Integer age;
  private String workUnit;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date birthDay;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date birthDayLunar;
  private String medicalHistory;
  private String nature;
  private String talkWilling;
  private String talkWay;
  private String talkTopic;
  private String consumePattern;
  private String income;
  private String healthFocus;
  private String priceFocus;
  private String brandFocus;
  private String acceptRecommend;
  private String otherInfo;
  private String cardUseType;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date createDate;
  private String createUser;
  private String shopCode;
  private String phoneNum;
  private ArrayList<ChxMemFamily> familyList;
  private java.math.BigDecimal saleSum;
  private java.math.BigDecimal profitSum;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date lastSaleDate;


  public ChxMem() {
  }

  public Integer getMemId() {
    return memId;
  }

  public void setMemId(Integer memId) {
    this.memId = memId;
  }


  public String getCardId() {
    return cardId;
  }

  public void setCardId(String cardId) {
    this.cardId = cardId;
  }


  public String getMemName() {
    return memName;
  }

  public void setMemName(String memName) {
    this.memName = memName;
  }


  public String getKindName() {
    return kindName;
  }

  public void setKindName(String kindName) {
    this.kindName = kindName;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public Integer getAge() {
    return age;
  }

  public void setAge(Integer age) {
    this.age = age;
  }


  public String getWorkUnit() {
    return workUnit;
  }

  public void setWorkUnit(String workUnit) {
    this.workUnit = workUnit;
  }

  public Date getBirthDay() {
    return birthDay;
  }

  public void setBirthDay(Date birthDay) {
    this.birthDay = birthDay;
  }


  public Date getBirthDayLunar() {
    return birthDayLunar;
  }

  public void setBirthDayLunar(Date birthDayLunar) {
    this.birthDayLunar = birthDayLunar;
  }


  public String getMedicalHistory() {
    return medicalHistory;
  }

  public void setMedicalHistory(String medicalHistory) {
    this.medicalHistory = medicalHistory;
  }


  public String getNature() {
    return nature;
  }

  public void setNature(String nature) {
    this.nature = nature;
  }


  public String getTalkWilling() {
    return talkWilling;
  }

  public void setTalkWilling(String talkWilling) {
    this.talkWilling = talkWilling;
  }


  public String getTalkWay() {
    return talkWay;
  }

  public void setTalkWay(String talkWay) {
    this.talkWay = talkWay;
  }


  public String getTalkTopic() {
    return talkTopic;
  }

  public void setTalkTopic(String talkTopic) {
    this.talkTopic = talkTopic;
  }


  public String getConsumePattern() {
    return consumePattern;
  }

  public void setConsumePattern(String consumePattern) {
    this.consumePattern = consumePattern;
  }

  public String getIncome() {
    return income;
  }

  public void setIncome(String income) {
    this.income = income;
  }

  public String getHealthFocus() {
    return healthFocus;
  }

  public void setHealthFocus(String healthFocus) {
    this.healthFocus = healthFocus;
  }

  public String getPriceFocus() {
    return priceFocus;
  }

  public void setPriceFocus(String priceFocus) {
    this.priceFocus = priceFocus;
  }

  public String getBrandFocus() {
    return brandFocus;
  }

  public void setBrandFocus(String brandFocus) {
    this.brandFocus = brandFocus;
  }


  public String getAcceptRecommend() {
    return acceptRecommend;
  }

  public void setAcceptRecommend(String acceptRecommend) {
    this.acceptRecommend = acceptRecommend;
  }

  public String getOtherInfo() {
    return otherInfo;
  }

  public void setOtherInfo(String otherInfo) {
    this.otherInfo = otherInfo;
  }

  public String getCardUseType() {
    return cardUseType;
  }

  public void setCardUseType(String cardUseType) {
    this.cardUseType = cardUseType;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }


  public String getCreateUser() {
    return createUser;
  }

  public void setCreateUser(String createUser) {
    this.createUser = createUser;
  }


  public String getShopCode() {
    return shopCode;
  }

  public void setShopCode(String shopCode) {
    this.shopCode = shopCode;
  }

  public String getPhoneNum() {
    return phoneNum;
  }

  public void setPhoneNum(String phoneNum) {
    this.phoneNum = phoneNum;
  }

  public ArrayList<ChxMemFamily> getFamilyList() {
    return familyList;
  }

  public void setFamilyList(ArrayList<ChxMemFamily> familyList) {
    this.familyList = familyList;
  }
  public java.math.BigDecimal getSaleSum() {
    return saleSum;
  }

  public void setSaleSum(java.math.BigDecimal saleSum) {
    this.saleSum = saleSum;
  }

  public java.math.BigDecimal getProfitSum() {
    return profitSum;
  }

  public void setProfitSum(java.math.BigDecimal profitSum) {
    this.profitSum = profitSum;
  }

  public Date getLastSaleDate() {
    return lastSaleDate;
  }

  public void setLastSaleDate(Date lastSaleDate) {
    this.lastSaleDate = lastSaleDate;
  }
}
