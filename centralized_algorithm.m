function [sensors,total] = centralized_algorithm(sensors, radius, time)
      %   out =[];
         epislon = 0.05;
         tube = zeros(length(radius),1);
         energy = epislon*ones(length(sensors),1);
         t=1;
         temp =zeros(3,1);
         total = 100*ones(length(sensors),1);
        consumption = radius*energy;
        j=1;
        while(t<time)
            % consumption = radius*energy;
        for d =1:length(radius)
             if(tube(d)~=0)
                 consumption(d) =10000;
             end
        end
         minvalue = consumption(1);
         i=1;
         while(i<length(radius))
             if(minvalue>consumption(i) && tube(i)==0)
                  minvalue = consumption(i);
                  j=i;
             end
             i=i+1;
         end
       %  out(end+1)=j;
         for k=1:length(sensors)
             if(sensors(k).energy>0)
              sensors(k).energy  = sensors(k).energy-radius(j,k)*energy(k); 
              else
              for d=1:length(radius)
                    if(radius(d,k)~=0)
                    tube(d) =d; 
                    end
              end
           disp('time');
           disp(t);
            end
         end
         for k=1:length(sensors)
             temp(k,1) = sensors(k).energy;
         end
         total(:,end+1)=temp;
         t= t+1;
        end 
end
           