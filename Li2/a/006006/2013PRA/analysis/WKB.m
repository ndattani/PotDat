hold('on')
potentialFile=load('../potential.txt');
r=potentialFile(:,1);
V=14903.2967364+potentialFile(:,2);

fig1=subplot(2,1,1);
plot(r,V,'LineWidth',6,'Color','b');
set(fig1,'Position',[0.130539083557952 0.64 0.775 0.341162790697675])
axis([3 10 -350 50])
line([0 10],[0 0],'LineWidth',3,'Color','k')  
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',1.5,'FontSize',15);
xlabel('$r ~~ [\rm{\AA}]$','Interpreter','Latex','FontSize',32)
ylabel('$V(r) ~~[\rm{cm}^{-1}]$','Interpreter','Latex','FontSize',32)

massOf6Li=6.015122795;

y=real(r.^3.*sqrt(0.5*massOf6Li*(-V)/16.857630));
y_C6=real(r.^3.*sqrt(0.5*massOf6Li*6.7185e6./(16.857630*r.^6)));
y_C8=real(r.^3.*sqrt(0.5*massOf6Li*(6.7185e6./r.^6+1.12629e8./r.^8)/(16.857630)));
y_C10=real(r.^3.*sqrt(0.5*massOf6Li*(6.7185e6./r.^6+1.12629e8./r.^8+2.78683e9./r.^10)/(16.857630)));
x=1./(r.^2);

fig2=subplot(2,1,2);
plot(x,y,'LineWidth',6,'Color','b');hold('on')
plot(x,y_C6,'LineWidth',6,'Color','r')
plot(x,y_C8,'LineWidth',6,'Color','g','LineStyle','-')
plot(x,y_C10,'LineWidth',6,'Color','m','LineStyle','-')
set(fig2,'Position',[0.13 0.09 0.775 0.455434565434565])
axis([0 1/10^2 900 1250])
box('on');
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',1.5,'FontSize',15);
xlabel('$1/r^2  ~~[\rm{\AA}^{-2}]$','Interpreter','Latex','FontSize',32)
ylabel('$r^3\sqrt{-m_{^6\rm{Li}}V(r)/33.71526}~~[\rm{\AA}^2]$','Interpreter','Latex','FontSize',25)

set(gcf, 'Color', 'w');
set(gcf,'renderer','Painters')

%export_fig WKB -pdf -eps -png