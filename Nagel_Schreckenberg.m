clear
clc
rlen = 1000; 
%Capacity of the road
cardens = 0.4; 
% Initial number of cars

entrance = floor(1000*rand(1));
exit = entrance + 500;

step = 2000;

if exit > 1000 
    exit = exit - 1000;
end
p1 = 0.1;
p2 = 0.2;
vmax = 10;
p = 0.2;
init_dist = 'random';

x = zeros(step,rlen);
v = zeros(step,rlen);
if strcmp(init_dist,'random')
    % initialize (random)
    for j = 1:rlen
        if rand<cardens
            %When the road can support more cars :
            x(1,j) = 1;
            v(1,j) = fix(rand*vmax);
        end
    end
else
    % initialize (uniform)
    j = 1:fix(1/cardens):rlen;
    x(1,j) = 1;
    v(1,j) = vmax;
end
ncar = sum(x(1,:));
% start time stepping
for t = 2:step
    for j = 1:rlen
        if x(t-1,j)==1
            if j == exit && rand<p2 
                    x(t,j) = 0;
            else
            
            next_car = find(x(t-1,j+1:end)==1,1,'first');
            if ~isempty(next_car)
                d = next_car;
            else
                next_car = find(x(t-1,1:j-1)==1,1,'first');
                d = next_car + rlen-j;
            end
            
            vtemp = min(v(t-1,j)+1,vmax);
            vtemp = min(vtemp,d-1);
            if rand<p
                vtemp = max(0,vtemp-1);
            end
            
            jj = j + vtemp;
            if jj>rlen
                jj = jj - rlen;
            end
            v(t,jj) = vtemp;
            x(t,jj) = 1;
            end
        else
            if j == entrance && rand < p1
                x(t,j) = 1;
            end
        end
    end
end
figure 
imagesc(x)
xlabel('x')
ylabel('t')
figure 
comet(x)
xlabel('x')
ylabel('t')
figure 
plot(1:step,mean(v.')*rlen/ncar)
xlabel('t')
ylabel('average velocity')

