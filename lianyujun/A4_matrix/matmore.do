set obs 10

gen x1=invnorm(uniform())
gen x2=invnorm(uniform())
gen x3=invnorm(uniform())
gen x4=invnorm(uniform())

matcorr x1 x2 x3 x4, m(R)
matcorr x1 x2 x3 x4, m(rho)

matewmf rho erho, f(exp)
matrix list erho

matselrc erho erho, c(1 3)
matrix list erho

matrix input A = (1,2,3,4,5\6,7,8,9,10\11,12,13,14,15\16,17,18,19,20)
matrix list A

matselrc A B, c(5/1)
matrix list B

matrix input A=(1,2,3\2,4,5\3,5,6)
matrix list A
matvec A AVEC
matrix list AVEC
matvec A AVECH
matrix list AVECH

matrix input C=(5,4,8,3,2)
matvsort C D
matrix list D

matrix input E=(1,2,3,4,5,6,7,8,9,10)
matvtom E EMR, r(5) c(2) o(r)
matrix list EMR

matvtom E EMC, r(5) c(2) o(c)
matrix list EMC

use /usr/local/stata/auto, clear
regress mpg weight gratio foreign
matrix c=e(b)'
svmat2 double c, name(bvector) r(bnames)
matrix list c

clear
set obs 10

gen x1=invnorm(uniform())
gen x2=invnorm(uniform())
gen x3=invnorm(uniform())
gen x4=invnorm(uniform())

matcorr x*, m(R)
svmatsv R, gen(corr) lh
li corr
