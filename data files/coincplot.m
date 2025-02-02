function coincplot

fileName = uigetfile('*.out');
file = importdata(fileName);

%time window
nstime=10;
%no. of bins
bins=50;

%max range of histogram to plot
window=nstime*10^(-9);
delay=zeros([length(file) 1]);
count=0;
countchnl0=0;
countchnl1=0;
index=1;

file(1,2)

for i=1:15%(length(file)-1)
    if file(i,1) == 0
		countchnl0 = countchnl0 + 1;
    elseif file(i,1) == 1
        countchnl1 = countchnl1 + 1;
    end

	%look for 0 then 1
	if (file(i,1) == 0 && file(i+1,1)==1) || (file(i,1)==1 && file(i+1,1)==0)
		%covert from picos to seconds
        delay(index) = (file(i+1,2) - file(i,2))/10^12;
        index = index + 1;
    end
end
countchnl0
countchnl1

delay(1:15)
