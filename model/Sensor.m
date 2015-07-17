classdef Sensor < handle
    properties (Hidden)
        state = 'active';
    end
    properties (SetAccess = private)
        longitude;
        latitude;
        energy =1000;
    end
    
    events
    stateChange;
    end
    
    methods
        function s = Sensor(longi,lati)
            s.longitude = longi;
            s.latitude = lati;
            Network.AddSensor(s);
        end
        
        function Sent(s,k,d)
            elec = 2.0;
            eamp = 1.0;
            s.energy= s.energy-elec*k+eamp*k*d^2;
            if s.energy < 0
                s.sensorstate = 'close';
            end
        end
        
        function Receive(s,k)
            elec =2.0;
            s.energy = s.energy-elec*k;
            if s.energy<0
                s.state = 'close';
            end
        end
        
        end
end