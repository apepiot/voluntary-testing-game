function [] = plot_figure_rhohat(vecRhomax1, c1, c2, alpha, vecC)
    %function that create figures of rhohat as a function of c 
    
    vecC1 = vecC(vecC<=c1);vecC2 = vecC(vecC>=c1);
    limit_y = 1.3*alpha; %alpha=rho'
    
    %blue area: region of elimination
    a=area([(c1-(c2-c1)/2) (c1-(c2-c1)/2) c1 c1],[0 limit_y limit_y 0],'LineStyle','none'); 
    a(1).FaceColor = [132/255, 151/255, 176/255];a.FaceAlpha = 0.5;
    hold on
    
    %vertical lines at c1 and c2
    plot(c1*ones(1,100), 0:limit_y/99:limit_y ,':','Color','k','LineWidth',1.5)
    hold on
    plot(c2*ones(1,100), 0:limit_y/99:limit_y ,':','Color','k','LineWidth',1.5)
    
    %horizontal line at rho'
    plot(vecC1,alpha*ones(length(vecC1),1),':','Color','k','LineWidth',1.5)
    vecRhomax12 = vecRhomax1(vecC>=c1); 
    
    %plot rhohat
    plot(vecC2,vecRhomax12,'-','LineWidth',4,'Color',[44/255, 63/255, 81/255])
    xlim([(c1-(c2-c1)/2),(c2+(c2-c1)/2)])
    %ylim([min(vecRhomax1),limit_y])
    ylim([0,limit_y])
    
    ey = 0.1*alpha;
    ex = abs(vecC(end)-vecC(1))*0.05;
    %text(c1,0-ey,['$$c_{',inf,'}^\prime$$'],'Interpreter','latex','FontSize',22,'FontWeight','bold','HorizontalAlignment', 'center')
    %text(c2,0-ey,['$c_{',inf,'}^0$'],'Interpreter','latex','FontSize',22,'FontWeight','bold','HorizontalAlignment', 'center')
    %text(c1,0-ey,'$$c^\prime$$','Interpreter','latex','FontSize',22,'FontWeight','bold','HorizontalAlignment', 'center')
    %text(c2,0-ey,['$c^$','\fontsize{8} 0',''],'Interpreter','latex','FontSize',22,'FontWeight','bold','HorizontalAlignment', 'center')
    text('position',[c1 0-ey 0],'interpreter','latex','string','\fontsize{22}{0}\selectfont$c$\fontsize{16}{0}\selectfont$^{\prime}$','HorizontalAlignment', 'center');
    text('position',[c2 0-ey 0],'interpreter','latex','string','\fontsize{22}{0}\selectfont$c$\fontsize{16}{0}\selectfont$^{0}$','HorizontalAlignment', 'center');
    
    %text((c1-(c2-c1)/2)-ex,alpha,'$\rho\prime$','Interpreter','latex','FontSize',22, 'FontWeight','bold','HorizontalAlignment', 'center')
    set(gca,'YTickLabel',[],'XTickLabel',[]);
    text((c2+(c2-c1)/2),0-ey,'$c$','Interpreter','latex','FontSize',22,'FontWeight','bold','HorizontalAlignment', 'center')
    %text(min(vecC)-1.2*ex,limit_y,'$\hat\rho$','Interpreter','latex','FontSize',22, 'FontWeight','bold','HorizontalAlignment', 'center')
    text(0,0-ey,'$$0$$','Interpreter','latex','FontSize',20,'FontWeight','bold','HorizontalAlignment', 'center')

    %y-axis
    text('position',[vecC(1)-ex 0 0],'interpreter','latex','string','\fontsize{22}{0}\selectfont$0$','HorizontalAlignment', 'center');
    text('position',[vecC(1)-ex limit_y 0],'interpreter','latex','string','\fontsize{22}{0}\selectfont$\hat\rho$','HorizontalAlignment', 'center');
    text('position',[vecC(1)-ex alpha 0],'interpreter','latex','string','\fontsize{22}{0}\selectfont$\rho$\fontsize{16}{0}\selectfont$^{\prime}$','HorizontalAlignment', 'center');
    
    %ZONES I II III
    text(c1-(c2-c1)/4,0.85*limit_y,'III','Interpreter','latex','FontSize',20,'FontWeight','bold','HorizontalAlignment', 'center')
    text((c1+c2)/2,0.85*limit_y,'II','Interpreter','latex','FontSize',20,'FontWeight','bold','HorizontalAlignment', 'center')
    text((c2+(c2+(c2-c1)/2))/2,0.85*limit_y,'I','Interpreter','latex','FontSize',20,'FontWeight','bold','HorizontalAlignment', 'center')
end

