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

% Argentina 8 8
PARG=45.2;
AARG=transpose(A.data(7,3:qa))/PARG;
BARG=transpose(B.data(7,3:qa))/PARG;
% Bangladesh
PBGD=165;
ABGD=transpose(A.data(21,3:qa))/PBGD;
BBGD=transpose(B.data(21,3:qa))/PBGD;
% Brazil 32 32
PBRA=213;
ABRA=transpose(A.data(31,3:qa))/PBRA;
BBRA=transpose(B.data(31,3:qa))/PBRA;
% Colombia 93 78
PCOL=50.9;
ACOL=transpose(A.data(93,3:qa))/PCOL;
BCOL=transpose(B.data(93,3:qa))/PCOL;
% France 131 116
PFRA=65.3;
AFRA=transpose(A.data(131,3:qa))/PFRA;
BFRA=transpose(B.data(131,3:qa))/PFRA;
% India
PIND=1380;
AIND=transpose(A.data(148,3:qa))/PIND;
BIND=transpose(B.data(148,3:qa))/PIND;
% Indonesia
PIDN=271;
AIDN=transpose(A.data(149,3:qa))/PIDN;
BIDN=transpose(B.data(149,3:qa))/PIDN;
% Italia 154 139
PITA=60.5;
AITA=transpose(A.data(154,3:qa))/PITA;
BITA=transpose(B.data(154,3:qa))/PITA;
% Japan
PJPN=125.36;
AJPN=transpose(A.data(156,3:qa))/PJPN;
BJPN=transpose(B.data(156,3:qa))/PJPN;
% South Korea
PKOR=51.3;
AKOR=transpose(A.data(161,3:qa))/PKOR;
BKOR=transpose(B.data(161,3:qa))/PKOR;
% Malaysia
PMYS=32;
AMYS=transpose(A.data(177,3:qa))/PMYS;
BMYS=transpose(B.data(177,3:qa))/PMYS;
% Mexico 183 168
PMEX=129;
AMEX=transpose(A.data(184,3:qa))/PMEX;
BMEX=transpose(B.data(184,3:qa))/PMEX;
% Nepal
PNPL=29.5;
ANPL=transpose(A.data(193,3:qa))/PNPL;
BNPL=transpose(B.data(193,3:qa))/PNPL;
% Pakistan
PPAK=221;
APAK=transpose(A.data(207,3:qa))/PPAK;
BPAK=transpose(B.data(207,3:qa))/PPAK;
% Philippines
PPHI=108;
APHI=transpose(A.data(213,3:qa))/PPHI;
BPHI=transpose(B.data(213,3:qa))/PPHI;
% Spain 235 220
PESP=46.8;
AESP=transpose(A.data(238,3:qa))/PESP;
BESP=transpose(B.data(238,3:qa))/PESP;
% Sri Lanka
PLKA=21.5;
ALKA=transpose(A.data(239,3:qa))/PLKA;
BLKA=transpose(B.data(239,3:qa))/PLKA;
% Thailand
PTHA=70;
ATHA=transpose(A.data(249,3:qa))/PTHA;
BTHA=transpose(B.data(249,3:qa))/PTHA;
% United Staes 251 236
PUSA=331;
AUSA=transpose(A.data(255,3:qa))/PUSA;
BUSA=transpose(B.data(255,3:qa))/PUSA;
% United Kingdom 266 251
PGBR=67.9;
AGBR=transpose(A.data(270,3:qa))/PGBR;
BGBR=transpose(B.data(270,3:qa))/PGBR;

newcolors = [0 0 1; 
             1 131/255 0; 
             0 1 0; 
             1 0 0; 
             138/255 43/255 226/255; 
             169/255 80/255 69/255;
             1 0 1; 
             220/255 220/255 220/255; 
             1 191/255 17/255; 
             0 191/255 1];
colororder(newcolors)         
         
% plot
subplot(2,2,1)
plot([AJPN,APHI,AMYS,AIDN,AIND,ANPL,APAK,ABGD,ALKA,ATHA],'LineWidth',2)
title('COVID-19 in Asia (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,2)
plot([BJPN,BPHI,BMYS,BIDN,BIND,BNPL,BPAK,BBGD,BLKA,BTHA],'LineWidth',2)
title('COVID-19 in Asia (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,3)
plot([AARG,ABRA,ACOL,AFRA,AITA,AMEX,AESP,AUSA,AGBR],'LineWidth',2)
title('COVID-19 in the World (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
% plot
subplot(2,2,4)
plot([BARG,BBRA,BCOL,BFRA,BITA,BMEX,BESP,BUSA,BGBR],'LineWidth',2)
title('COVID-19 in the World (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
