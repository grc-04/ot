
A=[1 2;1 1;1 -2] 
B=[10;6;1]
C=[2 1]
x=0:max(B)
x21=(B(1)-A(1,1)*x)/A(1,2)
x22=(B(2)-A(2,1)*x)/A(2,2)
x23=(B(3)-A(3,1)*x)/A(3,2)
plot(x,x21,'r',x,x22,'b',x,x23,'k')

