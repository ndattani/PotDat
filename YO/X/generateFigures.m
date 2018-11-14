clear('all')
%% Fundamental Constants

bohrRadii2angstroms=0.52917721092; % 5.2917721092(17)�10?11 from https://en.wikipedia.org/wiki/Bohr_radius
hartrees2wavenumbers=219474.6313705; % 219?474.631?3705(15) cm?1 from https://en.wikipedia.org/wiki/Hartree
eV2wavenumbers=8065.54468111324; % from http://www.highpressurescience.com/onlinetools/conversion.html
%%      << THEORETICAL LONG-RANGE POTENTIALS FOR b-STATE >>
%% 1.   Define the r array (independent variable) for theoretical long-range potential, and Set r_e, D_e, Delta E (all for b-state)
r=1:0.0001:100;

De=2.653261247786D+04;
re=1.784669014205D+00;                                     % (7,7) Li2 from Le Roy 2009 JCP 131 ar 204309 (same as in 2011 Le Roy 109 pg 435 since this state was fixed in that analysis)

V_lim=0;
%%     << DAMPING >>
rhoAB=1; 
%% 2.   Set C3,C6,C8,C9,C10,C11

%C6=dispersionCoefficientsFromAtomicUnits2spectroscopic(3.8236e4,0,6,1);              % 2007 Zhang
%C8=dispersionCoefficientsFromAtomicUnits2spectroscopic(2.4870e7,0,8,1);              % C8 sigma % 2007 Zhang
%C10=
%% 2_u state , no diagonalization
% Cm_power=[           3          6             8             ];
% Cm_Sigma_singlet_u=[C3         C6            C8             ];
% Cm_Sigma_triplet_u=[C3_Sigma_triplet_u C6_Sigma_triplet_u C8_Sigma_triplet_u];
% Cm_Pi_singlet_u=[C3_Pi_singlet_u C6_Pi_singlet_u C8_Pi_singlet_u];
% Cm_Pi_triplet_u=[C3p_triplet_u C6p_triplet_u C8p_triplet_u];
% 
% V=V_lim-zeros(length(Cm_power),length(r));
% V_undamped=V;
% 
% for ii=1:length(Cm_power)
%     for jj=1:ii;
%         Dm=(1-exp(-((3.30*rhoAB*r+0.423*(rhoAB*r).^2)/Cm_power(jj)))).^(Cm_power(jj)-1); % has dimension of r
%         V(ii,:)=V(ii,:)-(Cm_Pi_triplet_u(jj).*Dm./r.^Cm_power(jj));
%         V_undamped(ii,:)=V_undamped(ii,:)-(Cm_Pi_triplet_u(jj)./r.^Cm_power(jj));
%     end
% end

%V=V+deltaE;
%%      << ab initio GLOBAL POTENTIALS >>
%% 12.  Set r array and V array for (6,6) Li2 potential from Schmidt-Mink 1985 Chemical Physics. 
p3rRe=load('2p3rRe.txt');
r_2p3rRe=p3rRe(:,1);
V_2p3rRe=p3rRe(:,2);

%% 16.  Vibratioanl energies 
    v0=-26125.3095; 
 v( 1)=-25314.4731;
 v( 2)=-24499.8672;
 v( 3)=-23680.4130;
 v( 4)=-22856.0666;
 v( 5)=-22027.3447;
 v( 6)=-21195.0555;
 v( 7)=-20360.1490;
 v( 8)=-19523.6358;
 v( 9)=-18686.5438;
 v(10)=-17849.8953;
 v(11)=-17014.6978;
 v(12)=-16181.9407;
 v(13)=-15352.5984;
 v(14)=-14527.6350;
 v(15)=-13708.0132;
 v(16)=-12894.7044;
 v(17)=-12088.7012;
 v(18)=-11291.0317;
 v(19)=-10502.7767;
 v(20)= -9725.0881;
 v(21)= -8959.2107;
 v(22)= -8206.5061;
 v(23)= -7468.4803;
 v(24)= -6746.8151;
 v(25)= -6043.4044;
 v(26)= -5360.3974;
 v(27)= -4700.2488;
 v(28)= -4065.7810;
 v(29)= -3460.2583;
 v(30)= -2887.4773;
 v(31)= -2351.8734;
 v(32)= -1858.6397;
 v(33)= -1413.8371;
 v(34)= -1024.4354;
 v(35)=  -698.1243;
 v(36)=  -442.5226;
 v(37)=  -263.1322;
 v(38)=  -160.3223;
 v(39)=  -137.8973;
 v(40)=  -126.2486;
 v(41)=  -113.8065;
 v(42)=   -99.9786;
 v(43)=   -85.9056;
 v(44)=   -72.1818;
 v(45)=   -59.1599;
 v(46)=   -47.1021;
 v(47)=   -36.2153;
 v(48)=   -26.6625;
 v(49)=   -18.5649;
 v(50)=   -11.9981;
 v(51)=    -6.9822;
vibrationalEnergies=[v0 v]; 

%% 17. original ab initio points
abInitio=[...
1.40   +14261.50407
1.45   +2119.554369
1.50    -7261.573351
1.55    -14338.22524
1.60    -19489.74599
1.65    -23037.92764
1.70    -25258.20999
1.75    -26386.56216
1.80    -26624.61579
1.85    -26144.0316
1.90    -25090.2865
1.95    -23585.70341
2.00    -21730.07292
2.05    -19590.26169
2.10    -17115.14547
2.15    -14223.3123
2.20    -11197.94074
2.25    -8198.87177
2.30    -5299.739135
2.35    -2554.42179];

r_abInitio=abInitio(:,1);
V_abInitio=abInitio(:,2);
%%      << FIG 1 >>
%close('all')
%% 15.  Plot (6,6) Li2 potential from Semczuk 2013 PRA
figure1=figure(1);
hold('on')

set(gca,'Position',[0.0796365579903795 0.112214498510427 0.917156600748263 0.847070506454816])
set(gcf,'Color','w')

minX=1.4;maxX=3.25;
%splineMeshSize_for_r=0.01; % I just chose it to be of the same precision as r_e defined in cell 1. Splines can only be necessary for short-range, since long-range seems to have points very close together.
%splineMesh_for_r=minX:splineMeshSize_for_r:maxX;

%V_2p3rRe(
V_2p3rRe_spline=spline(r_2p3rRe,V_2p3rRe,r);

minY=-30000;maxY=5000;
axis([minX,maxX,minY,maxY])
line([minX maxX], [0 0],'Color','k','LineWidth',3)

hold('on')

% [Vmin_ab_initio, indexOfVmin_ab_initio]=min(V_ab_initio_spline);
% plotPointsSymmetricallyOnPotential(vibrationalEnergies(1:2:end),V_ab_initio_spline,splineMesh_for_r,indexOfVmin_ab_initio);

axis([minX,maxX,minY,maxY])
scatter(r_abInitio,V_abInitio,200,'MarkerFaceColor',[0,255,100]./255,'MarkerEdgeColor','k')
%plot(r_abInitio,V_abInitio,'Color',[0,255,100]./255,'Linewidth',3);
%plot(r,V_2p3rRe_spline,'Color','k','Linewidth',3);
plot(r_2p3rRe,V_2p3rRe,'Color','k','Linewidth',3);

vibrationalLevelsMeasured=[0:length(vibrationalEnergies)-1];
for vibrationalLevel=vibrationalLevelsMeasured+1
line([interp1(V_2p3rRe(r_2p3rRe<re),r_2p3rRe(r_2p3rRe<re),vibrationalEnergies(vibrationalLevel)) interp1(V_2p3rRe(r_2p3rRe>re),r_2p3rRe(r_2p3rRe>re),vibrationalEnergies(vibrationalLevel))], [vibrationalEnergies(vibrationalLevel) vibrationalEnergies(vibrationalLevel)],'Color','b','LineWidth',3)
r_innerTurningPoint(vibrationalLevel)=interp1(V_2p3rRe(r_2p3rRe<re),r_2p3rRe(r_2p3rRe<re),vibrationalEnergies(vibrationalLevel));
scatter(r_innerTurningPoint(vibrationalLevel),vibrationalEnergies(vibrationalLevel),'MarkerFaceColor','b','MarkerEdgeColor','b');
r_outerTurningPoint(vibrationalLevel)=interp1(V_2p3rRe(r_2p3rRe>re),r_2p3rRe(r_2p3rRe>re),vibrationalEnergies(vibrationalLevel));
scatter(r_outerTurningPoint(vibrationalLevel),vibrationalEnergies(vibrationalLevel),'MarkerFaceColor','b','MarkerEdgeColor','b');
end

annotation(figure1,'textbox',[0.717 0.308 0.107 0.0636],'String','$^{89}$Y$^{16}$O$\left(X,1^2\Sigma\right)$','LineStyle','none','Interpreter','latex','FontSize',36,'FontName','Helvetica','FitBoxToText','off');
annotation(figure1,'textbox',[0.668 0.530 0.107 0.0636],'String','MLR','LineStyle','none','Interpreter','latex','FontSize',24);
annotation(figure1,'textbox',[0.667 0.488 0.107 0.0636],'Color',[0,255,100]./255,'String','CCSD(T)','LineStyle','none','Interpreter','latex','FontSize',24);
annotation(figure1,'line',[0.621 0.677],[0.565 0.564],'LineWidth',3);
scatter(2.5,-12750,200,'MarkerFaceColor',[0,255,100]./255,'MarkerEdgeColor','k')
scatter(2.6,-12750,200,'MarkerFaceColor',[0,255,100]./255,'MarkerEdgeColor','k')


%title('YO(','Interpreter','Latex','FontSize',52)                                                                                    ('Internuclear distance \AA','Interpreter','Latex','FontSize',52)                                                                                    
box('on');
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',2,'FontSize',20);
xlabel('Internuclear distance \AA','Interpreter','Latex','FontSize',52)                                                                                    
ylabel('$V(r)$ cm$^{-1}$','Interpreter','Latex','FontSize',52)
%export_fig Nw=102.4_blocked_zoomed -pdf -eps -png