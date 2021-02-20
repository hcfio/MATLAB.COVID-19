websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
websave('time_series_covid19_deaths_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
% websave('time_series_covid19_recovered_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv');

A=importdata('time_series_covid19_confirmed_global.csv');
B=importdata('time_series_covid19_deaths_global.csv');
% C=importdata('time_series_covid19_recovered_global.csv');

[pa qa]=size(A.data);
% ATX=A.textdata(2:pa+1,2);
% [pb qb]=size(B.data);
% BTX=B.textdata(2:pb+1,2);
% [pc qc]=size(C.data);
% CTX=C.textdata(2:pc+1,2);

d0=datetime(2020,1,22);
d1=d0+days(qa-3);
D=days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor(D/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*D/3)),'yyyy-mm-dd');
l3=datestr(d1,'yyyy-mm-dd');

% Japan
PJPN=126;
AJPN=transpose(A.data(155,3:qa))/PJPN;
BJPN=transpose(B.data(155,3:qa))/PJPN;
% South Korea
PKOR=51.3;
AKOR=transpose(A.data(159,3:qa))/PKOR;
BKOR=transpose(B.data(159,3:qa))/PKOR;
% Philippines
PPHI=108;
APHI=transpose(A.data(209,3:qa))/PPHI;
BPHI=transpose(B.data(209,3:qa))/PPHI;
% Malaysia
PMYS=32;
AMYS=transpose(A.data(175,3:qa))/PMYS;
BMYS=transpose(B.data(175,3:qa))/PMYS;
% Indonesia
PIDN=271;
AIDN=transpose(A.data(148,3:qa))/PIDN;
BIDN=transpose(B.data(148,3:qa))/PIDN;
% India
PIND=1380;
AIND=transpose(A.data(147,3:qa))/PIND;
BIND=transpose(B.data(147,3:qa))/PIND;
% Nepal
PNPL=29;
ANPL=transpose(A.data(191,3:qa))/PNPL;
BNPL=transpose(B.data(191,3:qa))/PNPL;
% Pakistan
PPAK=221;
APAK=transpose(A.data(204,3:qa))/PPAK;
BPAK=transpose(B.data(204,3:qa))/PPAK;
% Bangladesh
PBGD=165;
ABGD=transpose(A.data(21,3:qa))/PBGD;
BBGD=transpose(B.data(21,3:qa))/PBGD;
% Sri Lanka
PLKA=21;
ALKA=transpose(A.data(235,3:qa))/PLKA;
BLKA=transpose(B.data(235,3:qa))/PLKA;

newcolors = [0 0 0; 
             0 1 0; 
             0 0 1; 
             0 1 1; 
             1 0 1; 
             1 0 0;
             0.85 0.325 0.098; 
             1 0.54 0; 
             0.47 0.25 0.8; 
             0.25 0.8 0.54];
colororder(newcolors)         
         
% plot
subplot(1,2,1)
plot([AJPN,APHI,AMYS,AIDN,AKOR AIND ANPL APAK ABGD ALKA],'LineWidth',2)
title('COVID-19 in Asia (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Location','northwest');
% plot
subplot(1,2,2)
plot([BJPN,BPHI,BMYS,BIDN,BKOR BIND BNPL BPAK BBGD BLKA],'LineWidth',2)
title('COVID-19 in Asia (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Location','northwest');
