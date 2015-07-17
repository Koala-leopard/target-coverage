classdef target < handle
    properties
       longitude;
       latitude;
    end
    methods
    function t = target(longi,lati)
             t.longitude = longi;
             t.latitude = lati;
             disp(['target', num2str(t.longitude), num2str(t.latitude)]);
    end
    end
end