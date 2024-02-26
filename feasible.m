%  Program to find All Basic Feasible Solution
clc 
clear all

A=[2 3 -1 4;1 -2 6 -7]
b=[8;-3]
c=[2 3 4 7]


% # cases discarded-
% 1. those which are singluar
% 2. any constraint is -ve

m=size(A,1);
n=size(A,2);

% Show error when this happens
if(n<m)
    error("n is less than m")
end


%  find combination - ncm
ncm=nchoosek(n,m);

% to make all combination
p=nchoosek(1:n,m);

sol=[]
% Now generate all basic solutions
for i=1:ncm
    y=zeros(n,1);
    A1=A(:,p(i,:));
    x=inv(A1)*b;


    % Now check whether any variable is -ve or not 
    % if -ve then reject as it is not a basic 
    if all(x>=0&x~=inf)
        y(p(i,:))=x;
        sol=[sol y];
    end
end
sol %these solutions are column-wise

z=c*sol
z

[maxz,index]=max(z)
final=sol(:,index)

fprintf('Optimal value is %i and Optimal solution is (x1,x2,x3,x4) (%f %f %f %f)',maxz,final)
