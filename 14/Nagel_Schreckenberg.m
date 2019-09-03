clear
road_length = 1000; % number of spaces
car_initial_density = .1; % number of cars
simulation_steps = 2000;
vmax = 200;
p = 0.2;
init_dist = 'random';

x = zeros(simulation_steps,road_length);
v = zeros(simulation_steps,road_length);
if strcmp(init_dist,'random')
    % initialize (random)
    for ii = 1:road_length
        if rand<car_initial_density
            x(1,ii) = 1;
            v(1,ii) = fix(rand*vmax);
        end
    end
else
    % initialize (uniform)
    ii = 1:fix(1/car_initial_density):road_length;
    x(1,ii) = 1;
    v(1,ii) = vmax;
end
ncar = sum(x(1,:));
% start time stepping
for tt = 2:simulation_steps
    for ii = 1:road_length
        if x(tt-1,ii)==1
            
            next_car = find(x(tt-1,ii+1:end)==1,1,'first');
            if ~isempty(next_car)
                d = next_car;
            else
                next_car = find(x(tt-1,1:ii-1)==1,1,'first');
                d = next_car + road_length-ii;
            end
            
            vtemp = min(v(tt-1,ii)+1,vmax);
            vtemp = min(vtemp,d-1);
            if rand<p
                vtemp = max(0,vtemp-1);
            end
            
            jj = ii + vtemp;
            if jj>road_length
                jj = jj - road_length;
            end
            v(tt,jj) = vtemp;
            x(tt,jj) = 1;
        end
    end
end
figure
imagesc(x)
xlabel('x')
ylabel('t')
figure
plot(1:simulation_steps,mean(v.')*road_length/ncar)
xlabel('t')
ylabel('average velocity')