clear all;close all;

%% SIS
clear all

beta = 3; gamma = 1.5; mu = 0.5; s = 0.8;
R0 = beta/(gamma+mu);
alpha = beta/s*(1-1/R0); %=rho'
c2 = 1-1/R0;
c1 = -c2;

%c interval
vecC = ((c1-(c2-c1)/2):(c2-c1)/100:(c2+(c2-c1)/2));
vecRhomax = max(0,beta/(2*s).*(1-1/R0-vecC));

figure()
plot_figure_rhohat(vecRhomax, c1, c2, alpha, vecC)
title('SIS model - $\hat\rho$ as a function of $c$','Interpreter', 'latex')

%% SIR
clear all

beta = 3; gamma = 1.5; mu = 0.5; s = 0.8;
R0 = beta/(gamma+mu);
alpha = beta/s*(1-1/R0); %=rho'
c2 = mu/beta*(R0-1);
c1 = -mu/beta*(1-1/R0);

%c interval
vecC = ((c1-(c2-c1)/2):(c2-c1)/100:(c2+(c2-c1)/2));
vecRhomax = max(0,beta*(sqrt(R0*mu./(mu+beta*vecC))-1)/(R0*s));

figure()
plot_figure_rhohat(vecRhomax, c1, c2, alpha, vecC)
title('SIR model - $\hat\rho$ as a function of $c$','Interpreter', 'latex')

%% SICAT
clear all

gamma = 0.1*1/15; sigma = 52/8; omega = 0.33; mu = 1/75; s = 1; R0 = 3.03;
beta  = R0*((sigma+gamma+mu).*(mu+gamma))/(omega*sigma+mu+gamma);
alpha = ((beta-sigma)/2 - (gamma+mu) + sqrt(((beta-sigma)/2)^2 + beta*omega*sigma))/s;

c1 = -mu/beta*min((2*s*alpha*sqrt((beta-sigma)^2/4+beta*omega*sigma)/(beta*(gamma+s*alpha+mu+omega*sigma))),1);
c2 = mu/beta*(R0-1);
vecC =(c1-(c2-c1)/2):(c2-c1)/1000:(c2+(c2-c1)/2);

i=1; 
vecRhomax = zeros(1,length(vecC));
for c=vecC    
    fun = @(rho) -U_SICAT(rho, beta, gamma, s, sigma, omega, mu, c);
    vecRhomax(i) = min(max(fmincon(fun,0),0),alpha);
    i=i+1; %c
end

figure()
plot_figure_rhohat(vecRhomax, c1, c2, alpha, vecC)
title('SICAT model - $\hat\rho$ as a function of $c$','Interpreter', 'latex')

