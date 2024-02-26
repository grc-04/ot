clc;
clear;

%% pahse 1 - input parameters
%%c = [1 2];
%%b = [10; 6; 1];
%%a = [1 2; 1 1; 1 -2];
a=[1 2;3 1;4 3];
b=[40;30;60];
c=[20 10];
%% phase 2 - plot lines
x1 = 0: max(b)

x21 = (b(1) - a(1, 1) * x1) / a(1, 2);
x22 = (b(2) - a(2, 1) * x1) / a(2, 2);
x23 = (b(3) - a(3, 1) * x1) / a(3, 2);

x21 = max(x21, 0)
x22 = max(x22, 0)
x23 = max(x23, 0)

plot(x1, x21, 'r', x1, x22, 'g', x1, x23, 'b');

% or
% plot(x1, x21);
% hold on;
% plot(x1, x22);
% plot(x1, x23);

title('Graphical Method');
xlabel('x1');
ylabel('x2');
legend('x1+2x2=10', 'x1+x2=6', 'x1-2x2=1');

%% phase 3 - find corner points with axis

c1 = find(x1==0)

c2 = find(x21==0)
line1 = [x1([c1 c2]); x21([c1 c2])]'

c3 = find(x22==0)
line2 = [x1([c1 c3]); x22([c1 c3])]'

c4 = find(x23==0)
line3 = [x1([c1 c4]); x23([c1 c4])]'  %transpose to keep points row wise

lines = [line1; line2; line3]
lines = unique(lines, 'rows')   % to remove duplicate entries

lines
%% phase 4 - intersecting points of lines

pt = [0; 0]
for i=1: size(a, 1)
        for j=i+1: size(a, 1)
            a1 = a([i j], :)
            b1 = b([i j])
            x = inv(a1) * b1   % using matrix methos to solve two lines equation
            pt = [pt x]
        end
end
pt = pt'


%% phase 5 - All points

allpt = [lines; pt]
allpt = unique(allpt, 'rows')


%% phase 6 - feasible region


for i=1: size(allpt, 1)
    const1(i) = a(1, 1) * allpt(i, 1) + a(1, 2) * allpt(i, 2) - b(1);
    const2(i) = a(2, 1) * allpt(i, 1) + a(2, 2) * allpt(i, 2) - b(2);
    const3(i) = a(3, 1) * allpt(i, 1) + a(3, 2) * allpt(i, 2) - b(3);
end

s1 = find(const1 > 0)
s2 = find(const2 > 0)
s3 = find(const3 > 0)

s = unique([s1 s2 s3])
allpt(s, :) = []


%% phase 7 - optimal value

allpt = allpt'
value = c * allpt
[obj, index] = max(value)

allpt = allpt'
x1 = allpt(index, 1)
x2 = allpt(index, 2)
