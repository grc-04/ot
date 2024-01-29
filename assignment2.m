clc
clear all
%max z=2x1+x2%
%x1+2x2<=10%
%x1+x2<=6%
%x1-2x2<1=%
%% phase 1 data entry and finding points
A=[1 2;1 1;1 -2] 
B=[10;6;1]
C=[2 1]
x=0:max(B)


x21=(B(1)-A(1,1)*x)/A(1,2)
x21=max(0,x21)
x22=(B(2)-A(2,1)*x)/A(2,2)
x22=max(0,x22)
x23=(B(3)-A(3,1)*x)/A(3,2)
x23=max(0,x23)

%% phase 2 plot the lines 
plot(x,x21,'r',x,x22,'b',x,x23,'k')
%%alt
%plot(x,x21)%
%hold on%
%plot(x,x22)%
%plot(x,23)%
xlabel('x1')
ylabel('x')
title('Solution')
legend('x1+2x2=10', 'x1+x2=6', 'x1-2x2=1')

%% phase 3 intersection with axes

c1=find(x==0)
c2=find(x21==0)
c3=find(x22==0)
c4=find(x23==0)
line1=[x([c1 c2]); x21([c1 c2])]
line2=[x([c1 c3]); x22([c1 c3])]
line3=[x([c1 c4]); x23([c1 c4])]
line1=line1'
line2=line2'
line3=line3'
lines=[line1;line2;line3]
lines=unique(lines,'rows') %% unique by rows

%% phase 4 corner points/intersection of lines
temp=[0;0]
for i=1:size(A,1)
    for j=i+1:size(A,1)
        A1=A([i j],:)
        B1=B([i j])
        p=inv(A1)*B1
        temp=[temp p]
    end
end
temp=temp'



