clear, close all;

% ############# Boundary and Initial Conditions ###################
Conditions.TimeVector = 0:.25:10;
Conditions.TopBoundry = 50*ones(size(Conditions.TimeVector));
Conditions.BottomBoundry = 100*ones(size(Conditions.TimeVector));
Conditions.HeightVect = 0:10;
Conditions.InitiHead = 0*ones(size(Conditions.HeightVect));
% -x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x


z.length     = 10;
z.discreteZ  = 0:1:10;
z.deltaZ     = 0.5;

t       = 0.5:0.5:10;
deltaT  = 0.5;
k = 0.835;

[temperature, z, deltaZ, deltaT] = HeatEqnImplicitMethod(Conditions, z, t, deltaT, k);

hndl = [];
figure
plot(z.discreteZ, temperature(:, 1))
getCurrentAxes = gca;
Ylimits = get(getCurrentAxes, 'YLim');
xlabel('x')
ylabel('temperature')
for i = 1:length(t)
    delete(hndl)
    hndl = plot(z.discreteZ, temperature(:, i));
    set(getCurrentAxes, 'YLim', Ylimits)
    pause(0.025)
end


