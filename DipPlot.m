% Code to plot the dip and fit a curve

% Get the coincidence data for the plot
%DipData;
Accidentals = Accidentals_1712_2;
Coincidences = Coincidences_1712_2;
Dist = Dist_1712_2;

% Distance in um and centred on the dip
Distum = (Dist-median(Dist))*1000;

% Fit combination of sinc and gaussian
fitEqn = '(a1*x + a2)*(1 - sinc(b*(x-c))*exp(-((x-c)/d)^2)) + e';
StartPts = [0.1 max(Coincidences) 0.01 0 100 min(Coincidences)];

% Plot graph
f = fit(Distum', Coincidences', fitEqn, 'Start', StartPts);
figure;
p = plot(f, Distum, Coincidences);
hold on;
plot(Distum, Accidentals,'.c','MarkerSize',10);
set(p, 'MarkerSize',10);
xlim([min(Distum) max(Distum)]);
ylim([0 max(Coincidences+1000)]);
xlabel('Path Difference \mum');
ylabel('Coincidences / s');
legend('Data','Fitted','Accidentals');
title('HOM Dip');