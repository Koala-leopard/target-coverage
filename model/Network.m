classdef Network 
    methods (Static)
        function Sensorstate(s)
            if s.energy<0
                s.state = 'close';
            end
        end
        function AddSensor(s)
                addlistener(s,'stateChange',...
                    @(src,evnt)Network.Sensor(src));
        end
    end
end