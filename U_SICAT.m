function [U] = U_SICAT(rho, beta, gamma, s, sigma, omega, mu, c)
   %-Utility for the SICAT model
    gammap = gamma+s*rho;
    Rp = beta.*(omega*sigma+mu+gammap)./((sigma+gammap+mu).*(mu+gammap));

    %prevalence 
    P = mu/beta.*(Rp-1);
    
    %utility
    U = rho.*(P-c);
end

