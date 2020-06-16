#####chapter 2 简单回归模型 #####
library(foreign)
#2.3
CEOSAL1=read.dta('CEOSAL1.DTA',convert.factors=F)
head(CEOSAL1)
fivenum(CEOSAL1$salary)*1000
fivenum(CEOSAL1$roe)
fitCEO=lm(salary~roe,data=CEOSAL1)
summary(fitCEO)
predict(fitCEO,data.frame(roe=30))
plot(salary~roe,data=CEOSAL1,type='n')
abline(fitCEO)

#2.4
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fitWAGE1=lm(wage~educ,data=WAGE1)
summary(fitWAGE1)
predict(fitWAGE1,data.frame(educ=8))

#2.5
VOTE1=read.dta('VOTE1.DTA',convert.factors=F)
head(VOTE1)
fitVOTE1=lm(voteA~shareA,data=VOTE1)
summary(fitVOTE1)
predict(fitVOTE1,data.frame(shareA=50))
predict(fitVOTE1,data.frame(shareA=60))

#2.6
cbind('roe'=CEOSAL1$roe[1:15],
      'salary'=CEOSAL1$salary[1:15],
      'salaryhat'=predict(fitCEO)[1:15],
      'uhat'=residuals(fitCEO)[1:15])

#2.7
mean(WAGE1$wage);mean(WAGE1$educ)
predict(fitWAGE1,data.frame(educ=12.56))
 
#2.8
summary(fitCEO)

#2.9
summary(fitVOTE1)

#2.10
fitlogWAGE1=lm(log(wage)~educ,data=WAGE1)
summary(fitlogWAGE1)

#2.11
fitlogCEO=lm(log(salary)~log(sales),data=CEOSAL1)
summary(fitlogCEO)

#2.12
MEAP93=read.dta('MEAP93.DTA',convert.factors=F)
head(MEAP93)
fitMEAP93=lm(math10~lnchprg,data=MEAP93)
summary(fitMEAP93)

#####chapter 3 多元回归分析：估计 #####
library(foreign)
#3.1
GPA1=read.dta('GPA1.DTA',convert.factors=F)
head(GPA1)
fitGPA1=lm(colGPA~hsGPA+ACT,GPA1)
summary(fitGPA1)
fGPA1=lm(colGPA~ACT,GPA1)
summary(fGPA1)

#3.2
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fitWAGE1=lm(log(wage)~educ+exper+tenure,data=WAGE1)
summary(fitWAGE1)

#3.3
data401K=read.dta('401K.DTA',convert.factors=F)
head(data401K)
fitdata401K=lm(prate~mrate+age,data401K)
summary(fitdata401K)
fdata401K=lm(prate~mrate,data401K)
summary(fdata401K)
cor(data401K$mrate,data401K$age)

#3.5
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
fitCRIME1=lm(narr86~pcnv+avgsen+ptime86+qemp86,CRIME1)
summary(fitCRIME1)
fCRIME1=lm(narr86~pcnv+ptime86+qemp86,CRIME1)
summary(fCRIME1)

#####chapter 4 多元回归分析：推断 #####
library(foreign)
#4.1
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fitWAGE1=lm(log(wage)~educ+exper+tenure,data=WAGE1)
summary(fitWAGE1)

#4.2
MEAP93=read.dta('MEAP93.DTA',convert.factors=F)
head(MEAP93)
fitMEAP93=lm(math10~totcomp+staff+enroll,data=MEAP93)
summary(fitMEAP93)

fMEAP93=lm(math10~log(totcomp)+log(staff)
           +log(enroll),data=MEAP93)
summary(fMEAP93)

#4.3
GPA1=read.dta('GPA1.DTA',convert.factors=F)
head(GPA1)
fitGPA1=lm(colGPA~hsGPA+ACT+skipped,GPA1)
summary(fitGPA1)

#4.5
HPRICE2=read.dta('HPRICE2.DTA',convert.factors=F)
head(HPRICE2)
fitHPRICE2=lm(log(price)~log(nox)+log(dist)+
                rooms+stratio,HPRICE2)
summary(fitHPRICE2)
t=(coefficients(fitHPRICE2)[2]+1)/0.116742;t

#4.6
data401K=read.dta('401K.DTA',convert.factors=F)
head(data401K)
fitdata401K=lm(prate~mrate+age+totemp,data401K)
summary(fitdata401K)

#4.7
JTRAIN=read.dta('JTRAIN.DTA',convert.factors=F)
head(JTRAIN)
JTRAIN=na.omit(JTRAIN)
fitJTRAIN=lm(log(scrap)~hrsemp+log(sales)+
               log(employ),JTRAIN)
summary(fitJTRAIN)

#4.8
RDCHEM=read.dta('RDCHEM.DTA',convert.factors=F)
head(RDCHEM)
fitRDCHEM=lm(log(rd)~lsales+profmarg,RDCHEM)
summary(fitRDCHEM)
confint(fitRDCHEM)

twoyear=read.dta('twoyear.dta')
head(twoyear)
fittwoyear=lm(lwage~jc+univ+exper,twoyear)
summary(fittwoyear)
t.test(twoyear$jc,twoyear$univ,
       alternative='less',var.equal=T)

ftwoyear=lm(lwage~jc+totcoll+exper,twoyear)
#totcoll=jc+univ
summary(ftwoyear)

MLB1=read.dta('MLB1.DTA',convert.factors=F)
head(MLB1)
fitMLB1=lm(lsalary~years+gamesyr+bavg+
             hrunsyr+rbisyr,MLB1)
summary(fitMLB1)
deviance(fitMLB1)
fMLB1=lm(lsalary~years+gamesyr,MLB1)
summary(fMLB1)
deviance(fMLB1)
f1=(deviance(fMLB1)-deviance(fitMLB1))/deviance(fitMLB1)*
  (353-5-1)/3
f1
f2=(0.6278-0.5971)/(1-0.6278)*(353-5-1)/3
f2

#4.9
BWGHT=read.dta('BWGHT.DTA',convert.factors=F)
head(BWGHT)
fitBWGHT=lm(bwght~cigs+parity+faminc+
           motheduc+fatheduc,BWGHT)
summary(fitBWGHT)
fBWGHT=lm(bwght~cigs+parity+faminc,BWGHT)
summary(fBWGHT)

f1=(deviance(fBWGHT)-deviance(fitBWGHT))/deviance(
  fitBWGHT)*(353-5-1)/3
f1
f2=(0.0387-0.0348)/(1-0.0387)*1185/2
f2

#4.10
MEAP93=read.dta('MEAP93.DTA',convert.factors=F)
head(MEAP93)
bs=MEAP93$benefits/MEAP93$salary
mean(bs);max(bs)
fit1=lm(log(MEAP93$salary)~bs)
summary(fit1)
t=(-0.8254+1)/0.19989;t
fit2=lm(log(MEAP93$salary)~bs+
          log(MEAP93$enroll)+log(MEAP93$staff))
summary(fit2)
fit3=lm(log(MEAP93$salary)~bs+
          log(MEAP93$enroll)+log(MEAP93$staff)+
          MEAP93$droprate+MEAP93$gradrate)
summary(fit3)

#####chapter 5 多元回归分析：OLS的渐进性 #####
library(foreign)
#5.3
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
fit1CRIME1=lm(narr86~pcnv+avgsen+tottime+
                ptime86+qemp86,CRIME1)
summary(fit1CRIME1)
#用LM统计量检验avgsen和tottime对narr86无影响
#step 1
fit2CRIME1=lm(narr86~pcnv+ptime86+qemp86,CRIME1)
summary(fit2CRIME1)
CRIME1$u=residuals(fit2CRIME1)#得到残差
#step 2
fit=lm(u~pcnv+avgsen+tottime+ptime86+qemp86,CRIME1)
summary(fit)
R_squared=0.001494#得到R-squared
#step 3
n=2725
LM=n*R_squared
#step 4
q=2#约束条件个数
p=1-pchisq(LM,q);p

f=(0.04276-0.04132)/(1-0.04276)*2719/2;f
pf(f,2,2719)#结果显示不拒绝原假设

#####chapter 6 多元回归分析：深入专题 #####
library(foreign)
#6.1
HPRICE2=read.dta('HPRICE2.DTA',convert.factors=F)
head(HPRICE2)
fitHPRICE2=lm(price~nox+crime+rooms+dist+stratio,HPRICE2)
summary(fitHPRICE2)

HPRICE2=scale(HPRICE2)
HPRICE2=as.data.frame(HPRICE2)
head(HPRICE2)
fit2HPRICE2=lm(price~nox+crime+rooms+dist+stratio,HPRICE2)
summary(fit2HPRICE2)

#6.2
HPRICE2=read.dta('HPRICE2.DTA',convert.factors=F)
head(HPRICE2)
fit3HPRICE2=lm(log(price)~log(nox)+log(dist)+
                rooms+I(rooms^2)+stratio,HPRICE2)
summary(fit3HPRICE2)

#6.3
attend=read.dta('attend.dta')
head(attend)
fitattend=lm(stndfnl~atndrte+priGPA+ACT+I(priGPA^2)+
               I(ACT^2)+priGPA:atndrte,attend)
summary(fitattend)

#6.5
gpa2=read.dta('gpa2.dta')
head(gpa2)
fit1gpa2=lm(colgpa~sat+hsperc+hsize+I(hsize^2),gpa2)
summary(fit1gpa2)
predict(fit1gpa2,data.frame(sat=1200,hsperc=30,hsize=5))

#下面解释变量都减去个体值
gpa2$sat0=gpa2$sat-1200
gpa2$hsperc0=gpa2$hsperc-30
gpa2$hsize0=gpa2$hsize-5
gpa2$hsizesq0=(gpa2$hsize)^2-25
fit2gpa2=lm(colgpa~sat0+hsperc0+hsize0+hsizesq0,gpa2)
summary(fit2gpa2)
#发现只有截距项变化了
#故colgpa的95%置信区间
2.7+c(-1,1)*1.96*1.988e-2

#6.6
residual.standard.error=0.5599
se=sqrt((1.988e-2)^2+(residual.standard.error)^2);se
CI=2.7+c(-1,1)*1.96*se;CI

#6.7 当因变量为log(y)时对y的预测
CEOSAL2=read.dta('CEOSAL2.DTA',convert.factors=F)
head(CEOSAL2)
#step 1
fitCEOSAL2=lm(lsalary~lsales+lmktval+ceoten,CEOSAL2)
summary(fitCEOSAL2)
hat=fitted(fitCEOSAL2)
u=residuals(fitCEOSAL2)
#step 2
alpha0=mean(exp(u));alpha0
#step 3
sales=5000;mktval=10000;ceoten=10
logy=predict(fitCEOSAL2,data.frame(lsales=log(sales),
             lmktval=log(mktval),ceoten=10))
logy;exp(logy)
#step 4
yhat=alpha0*exp(logy);yhat

#####chapter 7 含有定性信息的多元回归分析：虚拟变量 #####
library(foreign)
#7.1
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fitWAGE1=lm(wage~female+educ+exper+tenure,data=WAGE1)
summary(fitWAGE1)

fit2WAGE1=lm(wage~female,data=WAGE1)
summary(fit2WAGE1)

#7.2
GPA1=read.dta('GPA1.DTA',convert.factors=F)
head(GPA1)
fitGPA1=lm(colGPA~PC+hsGPA+ACT,GPA1)
summary(fitGPA1)

fit2GPA1=lm(colGPA~PC,GPA1)
summary(fit2GPA1)

#7.4
hprice1=read.dta('hprice1.dta')
head(hprice1)
fithprice1=lm(lprice~llotsize+lsqrft+
                bdrms+colonial,hprice1)
summary(fithprice1)
exp(0.054)-1

#7.5
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fitWAGE1=lm(lwage~female+educ+exper+
              I(exper^2)+tenure+I(tenure^2),data=WAGE1)
summary(fitWAGE1)
exp(-0.297)-1

#7.6
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
WAGE1$marrmale=rep(0,nrow(WAGE1))
WAGE1$marrfem=rep(0,nrow(WAGE1))
WAGE1$singfem=rep(0,nrow(WAGE1))
nr1=WAGE1[which(WAGE1$married==1 & WAGE1$female==0),]
nr2=WAGE1[which(WAGE1$married==1 & WAGE1$female==1),]
nr3=WAGE1[which(WAGE1$married==0 & WAGE1$female==1),]
WAGE1$marrmale[as.numeric(rownames(nr1))]=1
WAGE1$marrfem[as.numeric(rownames(nr2))]=1
WAGE1$singfem[as.numeric(rownames(nr3))]=1

fitWAGE1=lm(lwage~married+female+educ+exper+
              I(exper^2)+tenure+I(tenure^2),data=WAGE1)
summary(fitWAGE1)

fit2WAGE1=lm(lwage~marrmale+marrfem+singfem+educ+exper+
              I(exper^2)+tenure+I(tenure^2),data=WAGE1)
summary(fit2WAGE1)

#7.7
beauty=read.dta('beauty.dta')
head(beauty)
beautym=beauty[beauty$female==0,]
beautyfm=beauty[beauty$female==1,]
fit1beauty=lm(lwage~belavg+abvavg,beautym)
summary(fit1beauty)

fit2beauty=lm(lwage~belavg+abvavg,beautyfm)
summary(fit2beauty)

#7.8
LAWSCH85=read.dta('LAWSCH85.DTA',convert.factors=F)
head(LAWSCH85)
#将rank分类时的模型如下：
LAWSCH85$r61_100=rep(0,nrow(LAWSCH85))
nr=LAWSCH85[which(LAWSCH85$rank>60 & LAWSCH85$rank<101),]
LAWSCH85$r61_100[as.numeric(rownames(nr))]=1
fitLAWSCH85=lm(lsalary~top10+r11_25+r26_40+r41_60+
               r61_100+LSAT+GPA+llibvol+lcost,LAWSCH85)
summary(fitLAWSCH85)
#不将rank分类时的模型如下：
fit2LAWSCH85=lm(lsalary~rank+LSAT+GPA+llibvol+lcost,LAWSCH85)
summary(fit2LAWSCH85)

#7.10
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
fit3WAGE1=lm(lwage~female*educ+exper+
               I(exper^2)+tenure+I(tenure^2),data=WAGE1)
summary(fit3WAGE1)

#7.11
MLB1=read.dta('MLB1.DTA',convert.factors=F)
head(MLB1)
fitMLB1=lm(lsalary~years+gamesyr+bavg+hrunsyr+rbisyr+
             runsyr+fldperc+allstar+black+hispan+
             black:percblck+hispan:perchisp,MLB1)
summary(fitMLB1)

#使用同样的330个数据
MLB1=na.omit(MLB1)
fit2MLB1=lm(lsalary~years+gamesyr+bavg+hrunsyr+rbisyr+
             runsyr+fldperc+allstar,MLB1)
summary(fit2MLB1)

Ru=summary(fitMLB1)$r.squared
Rs=summary(fit2MLB1)$r.squared
f=(Ru-Rs)/(1-Ru)*317/4;f
pf(f,317,4)

#7.12
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
CRIME1$arr86=rep(1,nrow(CRIME1))
nr=CRIME1[CRIME1$narr86==0,]
CRIME1$arr86[as.numeric(rownames(nr))]=0
fitCRIME1=lm(arr86~pcnv+avgsen+tottime+
               ptime86+qemp86,CRIME1)
summary(fitCRIME1)

fit2CRIME1=lm(arr86~pcnv+avgsen+tottime+ptime86+
               qemp86+black+hispan,CRIME1)
summary(fit2CRIME1)

#####chapter 8 异方差性 #####
library(foreign)
#White异方差-稳健标准误程序
summaryw <- function(model) {
  s <- summary( model)
  X <- model.matrix(model)
  u2 <- residuals(model)^2
  XDX <- 0
  for(i in 1:nrow(X)) {
    XDX <- XDX + u2[i]*X[i,]%*%t(X[i,])
  }
  XX1 <- solve(t(X)%*%X)
  varcovar <- XX1 %*% XDX %*% XX1
  stdh <- sqrt(diag(varcovar))
  t <- model$coefficients/stdh
  p <- 2*pnorm(-abs(t))
  results <- cbind(model$coefficients, stdh, t, p)
  dimnames(results) <- dimnames(summary(model)$coefficients)
  results
}

#8.1
WAGE1=read.dta('WAGE1.DTA',convert.factors=F)
head(WAGE1)
WAGE1$marrmale=rep(0,nrow(WAGE1))
WAGE1$marrfem=rep(0,nrow(WAGE1))
WAGE1$singfem=rep(0,nrow(WAGE1))
nr1=WAGE1[which(WAGE1$married==1 & WAGE1$female==0),]
nr2=WAGE1[which(WAGE1$married==1 & WAGE1$female==1),]
nr3=WAGE1[which(WAGE1$married==0 & WAGE1$female==1),]
WAGE1$marrmale[as.numeric(rownames(nr1))]=1
WAGE1$marrfem[as.numeric(rownames(nr2))]=1
WAGE1$singfem[as.numeric(rownames(nr3))]=1

fitWAGE1=lm(lwage~marrmale+marrfem+singfem+educ+exper+
               I(exper^2)+tenure+I(tenure^2),data=WAGE1)
summary(fitWAGE1)
summaryw(fitWAGE1)
#8.2
GPA3=read.dta('GPA3.DTA',convert.factors=F)
head(GPA3)
GPA3=GPA3[GPA3$term==2,]
fitGPA3=lm(cumgpa~sat+hsperc+tothrs+female+black+
             white,GPA3)
summary(fitGPA3)
summaryw(fitGPA3)

fit2GPA3=lm(cumgpa~sat+hsperc+tothrs+female,GPA3)
summary(fit2GPA3)

Ru=summary(fitGPA3)$r.squared
Rs=summary(fit2GPA3)$r.squared
n=366;k=6;q=2
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)
#8.3
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
fit1CRIME1=lm(narr86~pcnv+avgsen+I(avgsen^2)+ptime86+
                qemp86+inc86+black+hispan,CRIME1)
summary(fit1CRIME1)
summaryw(fit1CRIME1)

#avgsen对narr86的转折点
cof=coefficients(fit1CRIME1)
abs(cof[3]/cof[4]/2)

#普通的LM统计量
#step 1
fit2CRIME1=lm(narr86~pcnv+ptime86+qemp86+inc86+black+
                hispan,CRIME1)
summary(fit2CRIME1)
CRIME1$u=residuals(fit2CRIME1)#得到残差
#step 2
fit=lm(u~pcnv+avgsen+I(avgsen^2)+ptime86+
         qemp86+inc86+black+hispan,CRIME1)
summary(fit)
R_squared=summary(fit)$r.squared#得到R-squared
#step 3
n=2725
LM=n*R_squared;LM
#step 4
q=2#约束条件个数
p=1-pchisq(LM,q);p

#稳健的LM统计量
#step 1
fit2CRIME1=lm(narr86~pcnv+ptime86+qemp86+inc86+black+
                hispan,CRIME1)
summary(fit2CRIME1)
CRIME1$u=residuals(fit2CRIME1)#得到残差
#step 2
fit1=lm(avgsen~pcnv+ptime86+qemp86+inc86+black+hispan,CRIME1)
CRIME1$r1=residuals(fit1)
fit2=lm(avgsen^2~pcnv+ptime86+qemp86+inc86+black+hispan,CRIME1)
CRIME1$r2=residuals(fit2)
#step 3
CRIME1$r1u=CRIME1$r1*CRIME1$u
CRIME1$r2u=CRIME1$r2*CRIME1$u
#step 4
CRIME1$c=rep(1,nrow(CRIME1))
fit=lm(c~r1u+r2u-1,CRIME1)#在不包含截距的情况下做回归
n=2725
LM=n-deviance(fit);LM
q=2#约束条件个数
p=1-pchisq(LM,q);p

#8.4 异方差的bp检验
hprice1=read.dta('hprice1.dta')
head(hprice1)
#step1
fithprice1=lm(price~lotsize+sqrft+bdrms,hprice1)
summary(fithprice1)
hprice1$u2=residuals(fithprice1)^2
#step2
fit=lm(u2~lotsize+sqrft+bdrms,hprice1)
Ru=summary(fit)$r.squared;Ru
#step3
n=88;k=3
f=Ru/(1-Ru)*(n-k-1)/k;f
1-pf(f,k,n-k-1)

LM=n*Ru;LM
1-pchisq(LM,k)
#结果显示均拒绝同方差的原假设
#还可以用lmtest包里的bptest函数
library(lmtest)
bptest(fithprice1)
#其中BP值约为LM统计量,p值与LM统计量的p值相似
#既然知道存在异方差,将模型适当地取对数能较好的消除异方差
fit2hprice1=lm(lprice~llotsize+lsqrft+bdrms,hprice1)
summary(fit2hprice1)
bptest(fit2hprice1)

#8.5异方差的White检验
hprice1=read.dta('hprice1.dta')
head(hprice1)
#step1
fit2hprice1=lm(lprice~llotsize+lsqrft+bdrms,hprice1)
summary(fit2hprice1)
hprice1$u2=residuals(fit2hprice1)^2
hprice1$yhat=fitted(fit2hprice1)
hprice1$yhat2=fitted(fit2hprice1)^2
#step2
fit=lm(u2~yhat+yhat2,hprice1)
Ru=summary(fit)$r.squared
#step
n=88;k=2;q=2
f=Ru/(1-Ru)*(n-k-1)/k;f
1-pf(f,k,n-k-1)

LM=n*Ru;LM
1-pchisq(LM,q)
#还可以用lmtest包中的bptest检验，对模型进行扩展，要增加上
#各个解释变量的平方项和解释变量之间的乘积项
fit3hprice1=lm(lprice~llotsize*lsqrft+llotsize*bdrms+
                 lsqrft*bdrms+I(llotsize^2)+
                 I(lsqrft^2)+I(bdrms^2),hprice1)
bptest(fit3hprice1)
#结果均显示不能拒绝同方差的原假设
data401=read.dta('401ksubs.dta')
head(data401)
data401=data401[data401$fsize==1,]
data401$ag=(data401$age-25)^2
#一元情况下OLS与WLS比较
fitdata401=lm(nettfa~inc,data401)
summaryw(fitdata401)#white稳健估计
fit2data401=lm(nettfa~inc,weights=1/inc,data401)
summary(fit2data401)
#多元情况下OLS与WLS比较
fit3data401=lm(nettfa~inc+ag+male+e401k,data401)
summaryw(fit3data401)
fit4data401=lm(nettfa~inc+ag+male+e401k,
               weights=1/inc,data401)
summary(fit4data401)

Ru=summary(fit4data401)$r.squared
Rs=summary(fit2data401)$r.squared
n=2017;q=3;k=4
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)

#8.7
SMOKE=read.dta('SMOKE.DTA',convert.factors=F)
head(SMOKE)
fitSMOKE=lm(cigs~lincome+lcigpric+educ+
              age+I(age^2)+restaurn,SMOKE)
summary(fitSMOKE)
SMOKE$u2=residuals(fitSMOKE)^2
fit=lm(u2~lincome+lcigpric+educ+
         age+I(age^2)+restaurn,SMOKE)
Ru=summary(fit)$r.squared;Ru
n=807;q=6
LM=n*Ru;LM
1-pchisq(LM,q)

#下面进行FGLS步骤
#step1
fitSMOKE=lm(cigs~lincome+lcigpric+educ+
              age+I(age^2)+restaurn,SMOKE)
summary(fitSMOKE)
SMOKE$u2=residuals(fitSMOKE)^2
#step2
fit=lm(log(u2)~lincome+lcigpric+educ+
         age+I(age^2)+restaurn,SMOKE)
ghat=fitted(fit)
#step3
h=exp(ghat)
#step4
fit2SMOKE=lm(cigs~lincome+lcigpric+educ+
              age+I(age^2)+restaurn,weights=1/h,SMOKE)
summary(fit2SMOKE)

#8.8
MROZ=read.dta('MROZ.DTA',convert.factors=F)
head(MROZ)
fitMROZ=lm(inlf~nwifeinc+educ+exper+I(exper^2)+
             age+kidslt6+kidsge6,MROZ)
summary(fitMROZ)
summaryw(fitMROZ)

#8.9
GPA1=read.dta('GPA1.DTA',convert.factors=F)
head(GPA1)
GPA1$parcoll=rep(0,nrow(GPA1))
nr=GPA1[which(GPA1$fathcoll==1 | GPA1$mothcoll==1),]
GPA1$parcoll[as.numeric(rownames(nr))]=1
fitGPA1=lm(PC~hsGPA+ACT+parcoll,GPA1)
summary(fitGPA1)
summaryw(fitGPA1)

#用WLS估计LPM
#step1
fitGPA1=lm(PC~hsGPA+ACT+parcoll,GPA1)
summary(fitGPA1)
yhat=fitted(fitGPA1)
#step2 如果yhat都在单位区间内，则进行step3，否则要调整yhat
range(yhat)
#step3
hhat=yhat*(1-yhat)
#step4
fit2GPA1=lm(PC~hsGPA+ACT+parcoll,weights=1/hhat,GPA1)
summary(fit2GPA1)

#####chapter 9 模型设定和数据问题的深入探讨 #####
library(foreign)
#9.1
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
fit1CRIME1=lm(narr86~pcnv+avgsen+tottime+ptime86+
                qemp86+inc86+black+hispan,CRIME1)
summary(fit1CRIME1)
fit2CRIME1=lm(narr86~pcnv+I(pcnv^2)+avgsen+tottime+ptime86+
                I(ptime86^2)+qemp86+inc86+I(inc86^2)+
                black+hispan,CRIME1)
summary(fit2CRIME1)

#9.2 RESET检验(回归设定误差检验)
hprice1=read.dta('hprice1.dta')
head(hprice1)
#step1
fithprice1=lm(price~lotsize+sqrft+bdrms,hprice1)
summary(fithprice1)
hprice1$yhat1=fitted(fithprice1)
#step2
fit1=lm(price~lotsize+sqrft+bdrms+
                I(yhat1^2)+I(yhat1^3),hprice1)
summary(fit1)
#step3
Ru1=summary(fit1)$r.squared
Rs1=summary(fithprice1)$r.squared
n=88;k=3;q=2
f=(Ru1-Rs1)/(1-Ru1)*(n-k-q-1)/q;f
1-pf(f,q,n-k-q-1)
#结果显示拒绝原假设,即原模型有误设
fit2hprice1=lm(lprice~llotsize+lsqrft+bdrms,hprice1)
summary(fit2hprice1)
hprice1$yhat2=fitted(fit2hprice1)
fit2=lm(lprice~llotsize+lsqrft+bdrms+
          I(yhat2^2)+I(yhat2^3),hprice1)
summary(fit2)

Ru2=summary(fit2)$r.squared
Rs2=summary(fit2hprice1)$r.squared
n=88;k=3;q=2
f=(Ru2-Rs2)/(1-Ru2)*(n-k-q-1)/q;f
1-pf(f,q,n-k-q-1)
#结果显示不拒绝原假设

#9.3
WAGE2=read.dta('WAGE2.DTA',convert.factors=F)
head(WAGE2)
fit1WAGE2=lm(lwage~educ+exper+tenure+married+south+
               urban+black,WAGE2)
summary(fit1WAGE2)
fit2WAGE2=lm(lwage~educ+exper+tenure+married+south+
               urban+black+IQ,WAGE2)
summary(fit2WAGE2)
fit3WAGE2=lm(lwage~educ*IQ+exper+tenure+married+south+
               urban+black,WAGE2)
summary(fit3WAGE2)

#9.8
RDCHEM=read.dta('RDCHEM.DTA',convert.factors=F)
head(RDCHEM)
fitRDCHEM=lm(rdintens~sales+profmarg,RDCHEM)
summary(fitRDCHEM)

plot(rdintens~sales,RDCHEM)
text(RDCHEM$sales,RDCHEM$rdintens)
#10号样本可能是异常值,剔除再做回归
fit2RDCHEM=lm(rdintens~sales+profmarg,RDCHEM[-10,])
summary(fit2RDCHEM)

#求学生化残差的一个方法
#step1 定义虚拟变量 异常值处取1,其余取0 
RDCHEM$c=rep(0,nrow(RDCHEM))
RDCHEM$c=replace(RDCHEM$c,10,1)
#step2
fit3RDCHEM=lm(rdintens~sales+profmarg+c,RDCHEM)
summary(fit3RDCHEM)
#c的系数就是10号异常值的学生化残差

#9.9
RDCHEM=read.dta('RDCHEM.DTA',convert.factors=F)
head(RDCHEM)
fitRDCHEM=lm(lrd~lsales+profmarg,RDCHEM)
summary(fitRDCHEM)
#去掉最大的企业后,做回归
fit2RDCHEM=lm(lrd~lsales+profmarg,
             RDCHEM[-c(which.max(RDCHEM$lsales)),])
summary(fit2RDCHEM)

#9.10
infmrt=read.dta('infmrt.dta')
head(infmrt)
infmrt=infmrt[infmrt$year==1990,]
fitinfmrt=lm(infmort~lpcinc+lphysic+lpopul,infmrt)
summary(fitinfmrt)
#去掉最大的企业后,做回归
fit2infmrt=lm(infmort~lpcinc+lphysic+lpopul,
              infmrt[-c(which.max(infmrt$lphysic)),])
summary(fit2infmrt)

#####chapter 10 时间序列数据的基本回归分析 #####
library(foreign)
#10.1
phillips=read.dta('phillips.dta')
head(phillips)
fitphillips=lm(inf~unem,phillips[1:49,])
summary(fitphillips)

#10.2
intdef=read.dta('intdef.dta')
head(intdef)
fitintdef=lm(i3~inf+def,intdef)
summary(fitintdef)

#10.3
PRMINWGE=read.dta('PRMINWGE.DTA',convert.factors=F)
head(PRMINWGE)
fitPRMINWGE=lm(lprepop~lmincov+lusgnp,PRMINWGE)
summary(fitPRMINWGE)

#10.4
FERTIL3=read.dta('FERTIL3.DTA',convert.factors=F)
head(FERTIL3)
fitFERTIL3=lm(gfr~pe+ww2+pill,FERTIL3)
summary(fitFERTIL3)
fit2FERTIL3=lm(gfr~pe+pe_1+pe_2+ww2+pill,FERTIL3)
summary(fit2FERTIL3)
cof=coefficients(fit2FERTIL3)
LRP=sum(cof[2:4]);LRP

FERTIL3$ee1=FERTIL3$pe_1-FERTIL3$pe
FERTIL3$ee2=FERTIL3$pe_2-FERTIL3$pe
fit3FERTIL3=lm(gfr~pe+ee1+ee2+ww2+pill,FERTIL3)
summary(fit3FERTIL3)
#pe的系数就是LRT
confint(fit3FERTIL3)[2,]

#10.5
BARIUM=read.dta('BARIUM.DTA',convert.factors=F)
head(BARIUM)
fitBARIUM=lm(lchnimp~lchempi+lgas+lrtwex+
               befile6+affile6+afdec6,BARIUM)
summary(fitBARIUM)

#10.6
FAIR=read.dta('FAIR.DTA',convert.factors=F)
head(FAIR)
fitFAIR=lm(demvote~partyWH+incum+partyWH:gnews+
             partyWH:inf,FAIR)
summary(fitFAIR)
cof=coefficients(fitFAIR)
cof[1]+cof[2]*1+cof[3]*1+cof[4]*1*3+cof[5]*1*3.019

#10.7
HSEINV=read.dta('HSEINV.DTA',convert.factors=F)
head(HSEINV)
fitHSEINV=lm(linvpc~lprice,HSEINV)
summary(fitHSEINV)
fit1=lm(linvpc~t,HSEINV)
summary(fit1)
fit2=lm(lprice~t,HSEINV)
summary(fit2)
fit2HSEINV=lm(linvpc~lprice+t,HSEINV)
summary(fit2HSEINV)

#10.8
FERTIL3=read.dta('FERTIL3.DTA',convert.factors=F)
head(FERTIL3)
fitFERTIL3=lm(gfr~pe+ww2+pill+t,FERTIL3)
summary(fitFERTIL3)
fit2FERTIL3=lm(gfr~pe+ww2+pill+t+I(t^2),FERTIL3)
summary(fit2FERTIL3)

#10.9
PRMINWGE=read.dta('PRMINWGE.DTA',convert.factors=F)
head(PRMINWGE)
fitPRMINWGE=lm(lprepop~lmincov+lusgnp,PRMINWGE)
summary(fitPRMINWGE)
fit2PRMINWGE=lm(lprepop~lmincov+lusgnp+t,PRMINWGE)
summary(fit2PRMINWGE)
#发现lusgnp变化很大,说明lusgnp含有趋势
#去除趋势的回归,不是简单的去掉t
#step1
fit1=lm(lprepop~t,PRMINWGE)
PRMINWGE$y=residuals(fit1)
fit2=lm(lmincov~t,PRMINWGE)
PRMINWGE$x1=residuals(fit2)
fit3=lm(lusgnp~t,PRMINWGE)
PRMINWGE$x2=residuals(fit3)
#step2
fit=lm(y~x1+x2,PRMINWGE)
summary(fit)
#最终的模型是fit而不是fitPRMINWGE

#10.10
HSEINV=read.dta('HSEINV.DTA',convert.factors=F)
head(HSEINV)
fitHSEINV=lm(linvpc~lprice,HSEINV)
summary(fitHSEINV)
fit2HSEINV=lm(linvpc~lprice+t,HSEINV)
summary(fit2HSEINV)
#因变量有趋势时R^2的计算
#step1
fit1=lm(linvpc~t,HSEINV)
HSEINV$y=residuals(fit1)
#step2
fit=lm(y~lprice+t,HSEINV)
summary(fit)$r.squared
summary(fit)$adj.r.squared

#10.11
BARIUM=read.dta('BARIUM.DTA',convert.factors=F)
head(BARIUM)
fitBARIUM=lm(lchnimp~feb+mar+apr+may+jun+jul+aug+sep+oct+
               nov+dec+lchempi+lgas+lrtwex+befile6+
               affile6+afdec6,BARIUM)
Ru=summary(fitBARIUM)$r.squared
fit2BARIUM=lm(lchnimp~lchempi+lgas+lrtwex+
               befile6+affile6+afdec6,BARIUM)
Rs=summary(fit2BARIUM)$r.squared
n=131;k=6;q=11
f=(Ru-Rs)/(1-Ru)*(n-k-q-1)/q;f
1-pf(f,q,n-k-q-1)
#结果表明季节虚拟变量不是联合显著
#去除季节性,与去除趋势步骤一样

#####chapter 11 OLS用于时间序列数据的其他问题 #####
library(foreign)
#11.4
NYSE=read.dta('NYSE.DTA',convert.factors=F)
head(NYSE)
fitNYSE=lm(return~return_1,NYSE)
summary(fitNYSE)
NYSE$return_2=rep(NA,nrow(NYSE))
NYSE$return_2=replace(NYSE$return_2,4:691,
                      NYSE$return_1[3:690])
fit2NYSE=lm(return~return_1+return_2,NYSE)
summary(fit2NYSE)
#fit2的F=1.659,p=0.1912,表明模型不显著

#11.5
phillips=read.dta('phillips.dta')
head(phillips)
phillips$inff=phillips$inf-phillips$inf_1
fitphillips=lm(inff~unem,phillips[1:49,])
summary(fitphillips)
cof=coefficients(fitphillips)
u0=-cof[1]/cof[2];u0#自然失业率

#11.6
FERTIL3=read.dta('FERTIL3.DTA',convert.factors=F)
head(FERTIL3)
a=data.frame(gfr=FERTIL3$gfr,gfr_1=FERTIL3$gfr_1,
             pe=FERTIL3$pe,pe_1=FERTIL3$pe_1)
a=na.omit(a)
cor(a[,1],a[,2])
cor(a[,3],a[,4])
#一阶自相关程度很高,暗示着单位根行为的存在,下面进行差分
a$gfrr=a[,1]-a[,2]
a$pee=a[,3]-a[,4]
fit1=lm(gfrr~pee,a)
summary(fit1)
#加入pee的二期滞后
a=data.frame(gfr=FERTIL3$gfr,gfr_1=FERTIL3$gfr_1,
             pe=FERTIL3$pe,pe_1=FERTIL3$pe_1,
             pe_2=FERTIL3$pe_2,pe_3=FERTIL3$pe_3)
a=na.omit(a)
a$gfrr=a[,1]-a[,2]
a$pee=a[,3]-a[,4]
a$pee1=a[,4]-a[,5]
a$pee2=a[,5]-a[,6]
fit2=lm(gfrr~pee+pee1+pee2,a)
summary(fit2)

Ru=summary(fit2)$r.squared
Rs=summary(fit1)$r.squared
n=69;k=3;q=2
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)

#11.7
EARNS=read.dta('EARNS.DTA',convert.factors=F)
head(EARNS)
fitEARNS=lm(lhrwage~loutphr+t,EARNS)
summary(fitEARNS)
#OLS法去除趋势
fit1=lm(lhrwage~t,EARNS);b1=residuals(fit1)
cor(b1[-1],b1[1:(length(b1)-1)])
fit2=lm(loutphr~t,EARNS);b2=residuals(fit2)
cor(b2[-1],b2[1:(length(b2)-1)])

EARNS$lhrr=c(NA,diff(EARNS$lhrwage))
EARNS$louu=c(NA,diff(EARNS$loutphr))
fit2EARNS=lm(lhrr~louu,EARNS)
summary(fit2EARNS)

#####chapter 12 时间序列中的序列相关和异方差 #####
library(foreign)
summaryw <- function(model) {
  s <- summary( model)
  X <- model.matrix(model)
  u2 <- residuals(model)^2
  XDX <- 0
  for(i in 1:nrow(X)) {
    XDX <- XDX + u2[i]*X[i,]%*%t(X[i,])
  }
  XX1 <- solve(t(X)%*%X)
  varcovar <- XX1 %*% XDX %*% XX1
  stdh <- sqrt(diag(varcovar))
  t <- model$coefficients/stdh
  p <- 2*pnorm(-abs(t))
  results <- cbind(model$coefficients, stdh, t, p)
  dimnames(results) <- dimnames(summary(model)$coefficients)
  results
}
#PW估计程序
PW <- function(mod){
  X <- model.matrix(mod)
  y <- model.response(model.frame(mod))
  e <- residuals(mod)
  n <- length(e)
  names <- colnames(X)
  rho <- sum(e[1:(n-1)]*e[2:n])/sum(e^2)
  y <- c(y[1] * (1 - rho^2)^0.5, y[2:n] - rho * y[1:(n-1)])
  X <- rbind(X[1,] * (1 - rho^2)^0.5, X[2:n,] - rho * X[1:(n-1),])
  mod <- lm(y ~ X - 1)
  result <- list()
  result$coef <- summary(mod)$coefficients
  summary <- summary(mod, corr = F)
  result$cov <- (summary$sigma^2) * summary$cov.unscaled
  dimnames(result$cov) <- list(names, names)
  result$sigma <- summary$sigma
  result$rho <- rho
  class(result) <- 'prais.winsten'
  result
}
#CO估计程序
CO <- function(mod){
  X <- model.matrix(mod)
  y <- model.response(model.frame(mod))
  e <- residuals(mod)
  n <- length(e)
  names <- colnames(X)
  rho <- sum(e[1:(n-1)]*e[2:n])/sum(e^2)
  y <- y[2:n] - rho * y[1:(n-1)]
  X <- X[2:n,] - rho * X[1:(n-1),]
  mod <- lm(y ~ X - 1)
  result <- list()
  result$coef <- summary(mod)$coefficients
  summary <- summary(mod, corr = F)
  result$cov <- (summary$sigma^2) * summary$cov.unscaled
  dimnames(result$cov) <- list(names, names)
  result$sigma <- summary$sigma
  result$rho <- rho
  class(result) <- 'cochrane.orcutt'
  result
}
#12.1
phillips=read.dta('phillips.dta')
phillips1=phillips[1:49,]
head(phillips1)
#解释变量严格外生时的AR(1)序列相关检验
#step1
fitphillips=lm(inf~unem,phillips1)
summary(fitphillips)
phillips1$u=residuals(fitphillips)
phillips1$u_1=c(NA,phillips1$u[1:48])
#step2
fit=lm(u~u_1,phillips1)
summary(fit)
#看u_1的p值

#DW检验
library(lmtest)
dwtest(fitphillips)
#p值显示存在自相关

#12.2
#解释变量不是严格外生时的AR(1)序列相关检验
#DW检验不再恰当，可用德宾h检验
#一般解释变量序列相关检验
PRMINWGE=read.dta('PRMINWGE.DTA',convert.factors=F)
head(PRMINWGE)
#step1
fitPRMINWGE=lm(lprepop~lmincov+lusgnp+lprgnp+t,PRMINWGE)
summary(fitPRMINWGE)
PRMINWGE$u=residuals(fitPRMINWGE)
PRMINWGE$u_1=c(NA,PRMINWGE$u[1:37])
#step2
fit2PRMINWGE=lm(u~lmincov+lusgnp+lprgnp+t+u_1,PRMINWGE)
summary(fit2PRMINWGE)
#看u_1的p值

#12.3
#AR(q)序列相关检验,q>1
#AR(3)序列相关检验
BARIUM=read.dta('BARIUM.DTA',convert.factors=F)
head(BARIUM)
#step1
fitBARIUM=lm(lchnimp~lchempi+lgas+lrtwex+
               befile6+affile6+afdec6,BARIUM)
summary(fitBARIUM)

BARIUM$u=residuals(fitBARIUM)
BARIUM$u_1=c(NA,BARIUM$u[1:130])
BARIUM$u_2=c(NA,BARIUM$u_1[1:130])
BARIUM$u_3=c(NA,BARIUM$u_2[1:130])
#step2
fit2BARIUM=lm(u~lchempi+lgas+lrtwex+befile6+affile6+
                afdec6+u_1+u_2+u_3,BARIUM)
summary(fit2BARIUM)
fit3BARIUM=lm(u~lchempi+lgas+lrtwex+befile6+affile6+
                afdec6,BARIUM)
summary(fit3BARIUM)
#step3
Ru=summary(fit2BARIUM)$r.squared
Rs=summary(fit3BARIUM)$r.squared
n=118;q=3
f=(Ru-Rs)/(1-Ru)*n/q;f
1-pf(f,q,n-k-1)

#可用BG检验
library(lmtest)
bgtest(fitBARIUM)

#12.4
#AR(1)模型的FGLS估计：普莱斯-温斯顿(PW)、科克伦-奥科特(CO)
#前者从t=1开始,后者从t=2开始，大样本下二者结果相似
BARIUM=read.dta('BARIUM.DTA',convert.factors=F)
head(BARIUM1)
#CO估计步骤:
#step1
fitBARIUM=lm(lchnimp~lchempi+lgas+lrtwex+
               befile6+affile6+afdec6,BARIUM)
summary(fitBARIUM)

BARIUM1=data.frame(lchnimp=BARIUM$lchnimp,lchempi=BARIUM$lchempi,
                   lgas=BARIUM$lgas,lrtwex=BARIUM$lrtwex,
                   befile6=BARIUM$befile6,affile6=BARIUM$affile6,
                   afdec6=BARIUM$afdec6)

BARIUM1$u=residuals(fitBARIUM)
BARIUM1$u_1=c(NA,BARIUM1$u[1:130])
#step2
fit=lm(u~u_1,BARIUM1)
cof=coefficients(fit)

BARIUM1$lchnimp_1=c(NA,BARIUM1$lchnimp[1:130])
BARIUM1$lchempi_1=c(NA,BARIUM1$lchempi[1:130])
BARIUM1$lgas_1=c(NA,BARIUM1$lgas[1:130])
BARIUM1$lrtwex_1=c(NA,BARIUM1$lrtwex[1:130])
BARIUM1$befile6_1=c(NA,BARIUM1$befile6[1:130])
BARIUM1$affile6_1=c(NA,BARIUM1$affile6[1:130])
BARIUM1$afdec6_1=c(NA,BARIUM1$afdec6[1:130])

BARIUM1$lchnimp1=BARIUM1$lchnimp-cof[2]*BARIUM1$lchnimp_1
BARIUM1$lchempi1=BARIUM1$lchempi-cof[2]*BARIUM1$lchempi_1
BARIUM1$lgas1=BARIUM1$lgas-cof[2]*BARIUM1$lgas_1
BARIUM1$lrtwex1=BARIUM1$lrtwex-cof[2]*BARIUM1$lrtwex_1
BARIUM1$befile61=BARIUM1$befile6-cof[2]*BARIUM1$befile6_1
BARIUM1$affile61=BARIUM1$affile6-cof[2]*BARIUM1$affile6_1
BARIUM1$afdec61=BARIUM1$afdec6-cof[2]*BARIUM1$afdec6_1
#step3
fit2BARIUM=lm(lchnimp1~lchempi1+lgas1+lrtwex1+
               befile61+affile61+afdec61,BARIUM1)
summary(fit2BARIUM)

PW(fitBARIUM)
CO(fitBARIUM)

#12.5
phillips=read.dta('phillips.dta')
phillips1=phillips[1:49,]
head(phillips1)

fit=lm(inf~unem,phillips1)
summary(fit)
PW(fit)#与书中结果不一样

#12.6
intdef=read.dta('intdef.dta')
head(intdef)
fitintdef=lm(i3~inf+def,intdef)
summary(fitintdef)

intdef$u=residuals(fitintdef)
intdef$u_1=c(NA,intdef$u[-nrow(intdef)])
fit=lm(u~u_1,intdef)
summary(fit)

fit2intdef=lm(ci3~cinf+cdef,intdef)
summary(fit2intdef)

#12.7#一种序列相关-稳健标准误：Newey-West HAC标准误
PRMINWGE=read.dta('PRMINWGE.DTA',convert.factors=F)
head(PRMINWGE)
fitPRMINWGE=lm(lprepop~lmincov+lusgnp+lprgnp+t,PRMINWGE)
a=summary(fitPRMINWGE);a
PW(fitPRMINWGE)

library(sandwich)；library(lmtest)
coeftest(fitPRMINWGE,vcov=NeweyWest(fitPRMINWGE))

#12.8
NYSE=read.dta('NYSE.DTA',convert.factors=F)
head(NYSE)
fitNYSE=lm(return~return_1,NYSE)
summary(fitNYSE)
NYSE$u2=c(NA,NA,summary(fitNYSE)$resi^2)

fit2NYSE=lm(u2~return_1,NYSE)
summary(fit2NYSE)

#12.9
NYSE=read.dta('NYSE.DTA',convert.factors=F)
head(NYSE)
fitNYSE=lm(return~return_1,NYSE)
summary(fitNYSE)

NYSE$u2=c(NA,NA,summary(fitNYSE)$resi^2)
NYSE$u2_1=c(NA,NYSE$u2[-nrow(NYSE)])
fit2NYSE=lm(u2~u2_1,NYSE)
summary(fit2NYSE)

#####chapter 13 跨时横截面的混合：简单面板数据方法 #####
library(foreign)
summaryw <- function(model) {
  s <- summary( model)
  X <- model.matrix(model)
  u2 <- residuals(model)^2
  XDX <- 0
  for(i in 1:nrow(X)) {
    XDX <- XDX + u2[i]*X[i,]%*%t(X[i,])
  }
  XX1 <- solve(t(X)%*%X)
  varcovar <- XX1 %*% XDX %*% XX1
  stdh <- sqrt(diag(varcovar))
  t <- model$coefficients/stdh
  p <- 2*pnorm(-abs(t))
  results <- cbind(model$coefficients, stdh, t, p)
  dimnames(results) <- dimnames(summary(model)$coefficients)
  results
}
#主要介绍一阶差分法
#13.1
FERTIL1=read.dta('FERTIL1.DTA',convert.factors=F)
head(FERTIL1)
fitFERTIL1=lm(kids~educ++age+I(age^2)+black+east+
                northcen+west+farm+othrural+town+
                smcity+y74+y76+y78+y80+y82+y84,FERTIL1)
summary(fitFERTIL1)
fit2FERTIL1=lm(kids~educ++age+I(age^2)+black+east+
                northcen+west+farm+othrural+town+
                smcity,FERTIL1)
summary(fit2FERTIL1)

Ru=summary(fitFERTIL1)$r.squared
Rs=summary(fit2FERTIL1)$r.squared
n=1129;k=17;q=6
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)

#13.2
CPS=read.dta('CPS78_85.DTA',convert.factors=F)
head(CPS)
fitCPS=lm(lwage~y85*educ+exper+I(exper^2)+union+
            y85*female,CPS)
summary(fitCPS)

#13.3
KIELMC=read.dta('KIELMC.DTA',convert.factors=F)
head(KIELMC)
KIELMC2=KIELMC[KIELMC$year==1978,]
KIELMC1=KIELMC[KIELMC$year==1981,]
fit1=lm(rprice~nearinc,KIELMC1)
summary(fit1)
fit2=lm(rprice~nearinc,KIELMC2)
summary(fit2)

fit3=lm(rprice~y81*nearinc,KIELMC)
summary(fit3)
#y81:nearinc的系数与下面方法计算一样
summary(fit1)$coef[2,1]-summary(fit2)$coef[2,1]

fit4=lm(lprice~y81*nearinc,KIELMC)
summary(fit4)

#13.4
INJURY=read.dta('INJURY.DTA',convert.factors=F)
head(INJURY)
INJURY1=INJURY[INJURY$ky==1,]
fit=lm(ldurat~afchnge*highearn,INJURY1)
summary(fit)

#13.5
SLP=read.dta('SLP75_81.DTA',convert.factors=F)
head(SLP)
SLP$slpnap=SLP$slpnap81-SLP$slpnap75
SLP$totwrk=SLP$totwrk81-SLP$totwrk75
SLP$educ=SLP$educ81-SLP$educ75
SLP$marr=SLP$marr81-SLP$marr75
SLP$yngkid=SLP$yngkid81-SLP$yngkid75
SLP$gdhlth=SLP$gdhlth81-SLP$gdhlth75
fit=lm(slpnap~totwrk+educ+marr+yngkid+gdhlth,SLP)
summary(fit)

fit2=lm(slpnap~totwrk,SLP)
summary(fit2)

Ru=summary(fit)$r.squared
Rs=summary(fit2)$r.squared
n=239;k=5;q=4
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)

model.fixed  <-plm(log(c)~log(q)+log(pf)+lf,data=paneldata,model="within" ,index=c("id","year"))

#13.7
JTRAIN=read.dta('JTRAIN.DTA',convert.factors=F)
head(JTRAIN)
JTRAIN1=JTRAIN[JTRAIN$d88==1,]
JTRAIN2=JTRAIN[which(JTRAIN$d88==0 & JTRAIN$d89==0),]
a=data.frame(scrap=JTRAIN1$scrap-JTRAIN2$scrap,
             grant=JTRAIN1$grant-JTRAIN2$grant,
             lscrap=JTRAIN1$lscrap-JTRAIN2$lscrap)
fit=lm(scrap~grant,a)
summary(fit)
fit2=lm(lscrap~grant,a)
summary(fit2)

TRAFFIC1=read.dta('TRAFFIC1.DTA',convert.factors=F)
head(TRAFFIC1)
TRAFFIC1$dthrte=TRAFFIC1$dthrte90-TRAFFIC1$dthrte85
TRAFFIC1$open=TRAFFIC1$open90-TRAFFIC1$open85
TRAFFIC1$admn=TRAFFIC1$admn90-TRAFFIC1$admn85
fit=lm(dthrte~open+admn,TRAFFIC1)
summary(fit)

#13.9
CRIME4=read.dta('CRIME4.DTA',convert.factors=F)
head(CRIME4)
fit=lm(clcrmrte~d83+d84+d85+d86+d87+clprbarr+clprbcon+
         clprbpri+clavgsen+clpolpc,CRIME4)
summary(fit)
summaryw(fit)

#####chapter 14 高深的面板数据方法 #####
library(foreign)
library(plm)
#14.1 14.3
JTRAIN=read.dta('JTRAIN.DTA',convert.factors=F)
head(JTRAIN)
JTRAIN=plm.data(JTRAIN,index=c('fcode','year'))
fitp=plm(lscrap~d88+d89+grant+grant_1,
         method='within',JTRAIN)#method默认'within
summary(fitp)
df=summary(fitp)$df.residual;df
fitp2=plm(lscrap~d88+d89+grant,JTRAIN)
summary(fitp2)

fitp3=plm(lscrap~d88+d89+grant+grant_1+lsales+lemploy,
         method='within',JTRAIN)
summary(fitp3)
df=summary(fitp3)$df.residual;df

#####chapter 15 工具变量估计与两阶段最小二乘法 #####
library(foreign)
library(systemfit)
#15.1
MROZ=read.dta('MROZ.DTA',convert.factors=F)
head(MROZ)
fit=lm(lwage~educ,MROZ)
summary(fit)
#用fatheduc作为educ的工具量
#fatheduc与u不相关；与educ相关
fit2=lm(educ~fatheduc,MROZ)
summary(fit2)

fit3=lm(lwage~fatheduc,MROZ)
summary(fit3)

#15.2
WAGE2=read.dta('WAGE2.DTA',convert.factors=F)
head(WAGE2)
#用sibs作为educ的工具变量
fit1=lm(educ~sibs,WAGE2)
summary(fit1)

fit2=lm(lwage~sibs,WAGE2)
summary(fit2)

#15.3
BWGHT=read.dta('BWGHT.DTA',convert.factors=F)
head(BWGHT)
fit1=lm(lbwght~packs,BWGHT)
summary(fit1)
fit2=lm(packs~cigprice,BWGHT)
summary(fit2)
#cigprice与packs不怎么相关
#仍将cigprice做为packs的工具变量的话
fit3=lm(lbwght~cigprice,BWGHT)
summary(fit3)
#无意义

#15.4
CARD=read.dta('CARD.DTA',convert.factors=F)
head(CARD)
fit1=lm(lwage~educ+exper+I(exper^2)+black+smsa+
          south+smsa66+reg662+reg663+reg664+reg665+
          reg666+reg667+reg668+reg669,CARD)
summary(fit1)
#nearc4作为educ的工具变量
fit2=lm(educ~nearc4+exper+I(exper^2)+black+smsa+
          south+smsa66+reg662+reg663+reg664+reg665+
          reg666+reg667+reg668+reg669,CARD)
summary(fit2)
#systemfit包中的systemfit函数
a=lwage~educ+exper+I(exper^2)+black+smsa+
  south+smsa66+reg662+reg663+reg664+reg665+
  reg666+reg667+reg668+reg669
b=~nearc4+exper+I(exper^2)+black+smsa+
  south+smsa66+reg662+reg663+reg664+reg665+
  reg666+reg667+reg668+reg669
fit4=systemfit(a,'2SLS',b,CARD)
summary(fit4)

#15.5 15.7 15.8
MROZ=read.dta('MROZ.DTA',convert.factors=F)
head(MROZ)
fit1=lm(educ~exper+I(exper^2)+motheduc+fatheduc,MROZ)
fit2=lm(educ~exper+I(exper^2),MROZ)

Ru=summary(fit1)$r.squared
Rs=summary(fit2)$r.squared
n=753;k=4;q=2
f=(Ru-Rs)/(1-Ru)*(n-k-1)/q;f
1-pf(f,q,n-k-1)
#educ与父母教育程度偏相关
fit3=systemfit(lwage~educ+exper+I(exper^2),
               '2SLS',~exper+I(exper^2)+motheduc+
                 fatheduc,MROZ)
summary(fit3)
#educ内生性检验
#step1
MROZ$u=summary(fit1)$resi
#step2
fit4=lm(lwage~educ+exper+I(exper^2)+u,MROZ)
summary(fit4)
#u不显著,表明educ不是内生的
#检验过渡识别约束
#step1
MROZ=cbind(MROZ,summary(fit3)$residuals)
#step2
fit5=lm(eq1~exper+I(exper^2)+motheduc+fatheduc,MROZ)
R2=summary(fit5)$r.squared
#step3
n=428;q=2-1#工具变量数减去内生变量数
1-pchisq(n*R2,q)
#通过了过渡识别检验
#15.9
FERTIL1=read.dta('FERTIL1.DTA',convert.factors=F)
head(FERTIL1)
a=kids~educ+age+I(age^2)+black+east+
                northcen+west+farm+othrural+town+
                smcity+y74+y76+y78+y80+y82+y84
b=~meduc+feduc+age+I(age^2)+black+east+
  northcen+west+farm+othrural+town+
  smcity+y74+y76+y78+y80+y82+y84
fit=systemfit(a,'2SLS',b,FERTIL1)
summary(fit)
fit2=lm(kids~educ+age+I(age^2)+black+east+
          northcen+west+farm+othrural+town+
          smcity+y74+y76+y78+y80+y82+y84,FERTIL1)
summary(fit2)
#对educ进行内生性检验
fit3=lm(educ~meduc+feduc+age+I(age^2)+black+east+
          northcen+west+farm+othrural+town+
          smcity+y74+y76+y78+y80+y82+y84,FERTIL1)
FERTIL1$u=summary(fit3)$resi
fit4=lm(kids~educ+age+I(age^2)+black+east+
          northcen+west+farm+othrural+town+
          smcity+y74+y76+y78+y80+y82+y84+u,FERTIL1)
summary(fit4)
#educ外生

#15.10
JTRAIN=read.dta('JTRAIN.DTA',convert.factors=F)
head(JTRAIN)
JTRAIN1=JTRAIN[JTRAIN$year==1987,]
JTRAIN2=JTRAIN[JTRAIN$year==1988,]
a=data.frame(chrsemp=JTRAIN2$hrsemp-JTRAIN1$hrsemp,
             cgrant=JTRAIN2$grant-JTRAIN1$grant,
             clscrap=JTRAIN2$lscrap-JTRAIN1$lscrap)
fit=lm(chrsemp~cgrant,a)
summary(fit)

fit2=systemfit(clscrap~chrsemp,'2SLS',~cgrant,a)
summary(fit2)

fit3=lm(clscrap~chrsemp,a)
summary(fit3)

#####chapter 16 联立方程模型 #####
library(foreign)
library(systemfit)
#16.5
MROZ=read.dta('MROZ.DTA',convert.factors=F)
head(MROZ)
system1=hours~lwage+educ+age+kidslt6+nwifeinc
system2=lwage~hours+educ+exper+I(exper^2)
system=list(system1,system2)
inst=~educ+age+kidslt6+nwifeinc+exper+I(exper^2)
fit <- systemfit(method="2SLS",formula=system,
                 inst=inst,MROZ)
summary(fit)

#16.6
OPENNESS=read.dta('OPENNESS.DTA',convert.factors=F)
head(OPENNESS)
fit1=lm(open~lpcinc+lland,OPENNESS)
summary(fit1)

fit2=systemfit(inf~open+lpcinc,'2SLS',
               ~lland+lpcinc,OPENNESS)
summary(fit2)

#16.7
consump=read.dta('consump.dta')
head(consump)
fit=systemfit(gc~gy+r3,'2SLS',~gc_1+gy_1+r3_1,consump)
summary(fit)
consump=cbind(consump,summary(fit)$residuals)
consump$eq1_1=c(NA,consump$eq1[-nrow(consump)])
fit2=systemfit(gc~gy+r3+eq1_1,'2SLS',
               ~gc_1+gy_1+r3_1,consump)
summary(fit2)

#####chapter 17 限值因变量模型和样本选择纠正 #####
library(foreign)
library(VGAM)
library(sampleSelection)
summaryw <- function(model) {
  s <- summary( model)
  X <- model.matrix(model)
  u2 <- residuals(model)^2
  XDX <- 0
  for(i in 1:nrow(X)) {
    XDX <- XDX + u2[i]*X[i,]%*%t(X[i,])
  }
  XX1 <- solve(t(X)%*%X)
  varcovar <- XX1 %*% XDX %*% XX1
  stdh <- sqrt(diag(varcovar))
  t <- model$coefficients/stdh
  p <- 2*pnorm(-abs(t))
  results <- cbind(model$coefficients, stdh, t, p)
  dimnames(results) <- dimnames(summary(model)$coefficients)
  results
}
#17.1 17.2 17.5
MROZ=read.dta('MROZ.DTA',convert.factors=F)
head(MROZ)
fit=lm(inlf~nwifeinc+educ+exper+I(exper^2)+age+
         kidslt6+kidsge6,MROZ)
summaryw(fit)
fit2=glm(inlf~nwifeinc+educ+exper+I(exper^2)+age+
           kidslt6+kidsge6,family=binomial,MROZ)
summary(fit2)
fit3=glm(inlf~nwifeinc+educ+exper+I(exper^2)+age+
           kidslt6+kidsge6,family=binomial(link='probit'),
         MROZ)
summary(fit3)

fit4=lm(hours~nwifeinc+educ+exper++I(exper^2)+age+
          kidslt6+kidsge6,MROZ)
summary(fit4)
fit5=vglm(hours~nwifeinc+educ+exper++I(exper^2)+age+
             kidslt6+kidsge6,data=MROZ,tobit)
summary(fit5)

summary(lm(hours~educ,MROZ))
#样本选择纠正heckit方法
fit6=heckit(inlf~nwifeinc+educ+exper+I(exper^2)+age+
              kidslt6+kidsge6,lwage~educ+exper+I(exper^2),
            MROZ)
summary(fit6)

#17.3
CRIME1=read.dta('CRIME1.DTA',convert.factors=F)
head(CRIME1)
fit=lm(narr86~pcnv+avgsen+tottime+ptime86+
         qemp86+inc86+black+hispan+born60,CRIME1)
summary(fit)
fit2=glm(narr86~pcnv+avgsen+tottime+ptime86+
         qemp86+inc86+black+hispan+born60,
         family=poisson,CRIME1)
summary(fit2)

#17.4
recid=read.dta('recid.dta')
head(recid1)
recid1=recid[recid$cens==0,]
fit=lm(ldurat~workprg+priors+tserved+felon+
         alcohol+drugs+black+married+educ+
         age,recid1)
summary(fit)

#####chapter 18 时间序列高深专题 #####
library(foreign)
#18.1
HSEINV=read.dta('HSEINV.DTA',convert.factors=F)
head(HSEINV)
#对linvpc除线性趋势
#考伊克分布滞后(GDL)
fit1=lm(linvpc~t,HSEINV)
HSEINV$yhat=summary(fit1)$resi
HSEINV$yhat_1=c(NA,HSEINV$yhat[-nrow(HSEINV)])
fit2=lm(yhat~gprice+yhat_1,HSEINV)
summary(fit2)
#理性分布滞后(RDL)
HSEINV$gprice_1=c(NA,HSEINV$gprice[-nrow(HSEINV)])
fit3=lm(yhat~gprice+gprice_1+yhat_1,HSEINV)
summary(fit3)

#18.2
INTQRT=read.dta('INTQRT.DTA',convert.factors=F)
head(INTQRT)
#单位根检验之DF test
fit=lm(cr3~r3_1,INTQRT)
summary(fit)
#我们不能用r3_1的标准误来构造置信区间,t=-2.473对比表18.2
#10%水平上的临界值为-2.57,不拒绝H0；roh=1

#18.3
phillips=read.dta('phillips.dta')
head(phillips)
#增广的DF test
phillips$cinf_1=c(NA,phillips$cinf[-nrow(phillips)])
fit=lm(cinf~inf_1+cinf_1,phillips[1:49,])
summary(fit)
#inf_1的t=-3.02对比表18.2的5%水平上的临界值为-2.86
#拒绝H0；roh=1,接收H1；roh<1

#18.4
#含有线性趋势的单位根检验
INVEN=read.dta('INVEN.DTA',convert.factors=F)
head(INVEN)
#检验log(gdp)是否有单位跟
INVEN$t=c(1:nrow(INVEN))
INVEN$gdp_1=c(NA,INVEN$gdp[-nrow(INVEN)])
INVEN$ggdp_1=c(NA,INVEN$ggdp[-nrow(INVEN)])
fit=lm(ggdp~t+log(gdp_1)+ggdp_1,INVEN)
summary(fit)
#log(gdp_1)的t=-2.421,对比表18.3的10%水平-3.12
#不能拒绝H0:rho=1

#18.7
INTQRT=read.dta('INTQRT.DTA',convert.factors=F)
head(INTQRT)
fit=lm(hy6~hy3_1,INTQRT)
summary(fit)
#误差纠正模型
INTQRT$hy3_2=c(NA,INTQRT$hy3_1[-nrow(INTQRT)])
INTQRT$hy6_hy3=INTQRT$hy6_1-INTQRT$hy3_2
fit2=lm(chy6~chy3_1+hy6_hy3,INTQRT)
summary(fit2)

#18.8 18.9 18.10
phillips=read.dta('phillips.dta')
head(phillips)
fit=lm(unem~unem_1,phillips[1:49,])
summary(fit)
fit2=lm(unem~unem_1+inf_1,phillips[1:49,])
summary(fit2)
pr1=predict(fit,newdata=data.frame(unem_1=5.4));pr1
pr2=predict(fit2,data.frame(unem_1=5.4,inf_1=3));pr2

phillips$unem_11=phillips$unem_1-5.4
phillips$inf_11=phillips$inf_1-3
fit3=lm(unem~unem_11+inf_11,phillips)
summary(fit3)
se=sqrt(summary(fit3)$coef[1,2]^2+summary(fit3)$sigma^2)
#pr2的预测区间:
pr2+c(-1,1)*1.96*se

pr11=predict(fit,
     data.frame(unem_1=phillips$unem_1[-(1:49)]))
pr22=predict(fit2,
     data.frame(unem_1=phillips$unem_1[-(1:49)],
                inf_1=phillips$inf_1[-(1:49)]))
RSEM=sqrt(mean((phillips$unem[-(1:49)]-pr11)^2));RSEM
MAE=mean(abs(phillips$unem[-(1:49)]-pr11));MAE
RSEM2=sqrt(mean((phillips$unem[-(1:49)]-pr22)^2));RSEM2
MAE2=mean(abs(phillips$unem[-(1:49)]-pr22));MAE2

fit3=lm(inf~inf_1,phillips[1:49,])
summary(fit3)
inf1997=predict(fit3,data.frame(inf_1=phillips$inf[49]))
inf1997
unem1998=predict(fit2,data.frame(unem_1=pr2,inf_1=inf1997))
unem1998
