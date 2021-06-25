websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

websave('nhk_news_covid19_domestic_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_domestic_daily_data.csv');
JP=importdata('nhk_news_covid19_domestic_daily_data.csv');
JPN1=JP.data(:,2)/126;
JPN2=JP.data(:,4)/126;
JPN3=JP.data(:,1)/126;

dd0=strrep(A.textdata(2,1),'/','-');
d0=datetime(dd0);
dd1=strrep(A.textdata(l+1,1),'/','-');
d1=datetime(dd1);
D=days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor(D/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*D/3)),'yyyy-mm-dd');
lf=datestr(d1,'yyyy-mm-dd');

% Okinawa (1.46M): code 47
rowoknw=find(B(:)==47);
OKNW1=A.data(rowoknw,2)/1.46;
OKNW2=A.data(rowoknw,4)/1.46;
OKNW3=A.data(rowoknw,1)/1.46;
% Hokkaido (5.27M): code 1, 
rowhkd=find(B(:)==1);
HKD1=A.data(rowhkd,2)/5.27;
HKD2=A.data(rowhkd,4)/5.27;
HKD3=A.data(rowhkd,1)/5.27;
% Tokyo (14M): code 13, 
rowtky=find(B(:)==13);
TKY1=A.data(rowtky,2)/14;
TKY2=A.data(rowtky,4)/14;
TKY3=A.data(rowtky,1)/14;
% Osaka (8.81M): code 27
rowosk=find(B(:)==27);
OSK1=A.data(rowosk,2)/8.81;
OSK2=A.data(rowosk,4)/8.81;
OSK3=A.data(rowosk,1)/8.81;
% Hyogo (5.43M): code 28
rowhyg=find(B(:)==28);
HYG1=A.data(rowhyg,2)/5.43;
HYG2=A.data(rowhyg,4)/5.43;
HYG3=A.data(rowhyg,1)/5.43;
% Saitama (7.34M): code 11, 
rowstm=find(B(:)==11);
STM1=A.data(rowstm,2)/7.34;
STM2=A.data(rowstm,4)/7.34;
% STM3=A.data(rowstm,1)/7.34;
% kanagawa (9.22M): code 14
rowkng=find(B(:)==14);
KNG1=A.data(rowkng,2)/9.22;
KNG2=A.data(rowkng,4)/9.22;
% KNG3=A.data(rowkng,1)/9.22;
% Chiba (6.28M): code 12
rowchb=find(B(:)==12);
CHB1=A.data(rowchb,2)/6.28;
CHB2=A.data(rowchb,4)/6.28;
% CHB3=A.data(rowchb,1)/6.28;
% Kyoto (2.57M): code 26
rowkyt=find(B(:)==26);
KYT1=A.data(rowkyt,2)/2.57;
KYT2=A.data(rowkyt,4)/2.57;
% KYT3=A.data(rowkyt,1)/2.57;

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

D0=datetime(2020,1,22);
D1=D0+days(qa-3);
DD=days(D1-D0);
L0=datestr(D0,'yyyy-mm-dd');
L1=datestr(D0+days(floor(DD/3)),'yyyy-mm-dd');
L2=datestr(D0+days(floor(2*DD/3)),'yyyy-mm-dd');
L3=datestr(D1,'yyyy-mm-dd');

% Japan
PJPN=126;
AJPN=transpose(A.data(156,3:qa))/PJPN;
BJPN=transpose(B.data(156,3:qa))/PJPN;
% South Korea
PKOR=51.3;
AKOR=transpose(A.data(161,3:qa))/PKOR;
BKOR=transpose(B.data(161,3:qa))/PKOR;
% Philippines
PPHI=108;
APHI=transpose(A.data(213,3:qa))/PPHI;
BPHI=transpose(B.data(213,3:qa))/PPHI;
% Malaysia
PMYS=32;
AMYS=transpose(A.data(177,3:qa))/PMYS;
BMYS=transpose(B.data(177,3:qa))/PMYS;
% Indonesia
PIDN=271;
AIDN=transpose(A.data(149,3:qa))/PIDN;
BIDN=transpose(B.data(149,3:qa))/PIDN;
% India
PIND=1380;
AIND=transpose(A.data(148,3:qa))/PIND;
BIND=transpose(B.data(148,3:qa))/PIND;
% Nepal
PNPL=29.5;
ANPL=transpose(A.data(193,3:qa))/PNPL;
BNPL=transpose(B.data(193,3:qa))/PNPL;
% Pakistan
PPAK=221;
APAK=transpose(A.data(207,3:qa))/PPAK;
BPAK=transpose(B.data(207,3:qa))/PPAK;
% Bangladesh
PBGD=165;
ABGD=transpose(A.data(21,3:qa))/PBGD;
BBGD=transpose(B.data(21,3:qa))/PBGD;
% Sri Lanka
PLKA=21.5;
ALKA=transpose(A.data(239,3:qa))/PLKA;
BLKA=transpose(B.data(239,3:qa))/PLKA;
% Argentina 8 8
PARG=45.2;
AARG=transpose(A.data(7,3:qa))/PARG;
BARG=transpose(B.data(7,3:qa))/PARG;
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
% Italia 154 139
PITA=60.5;
AITA=transpose(A.data(154,3:qa))/PITA;
BITA=transpose(B.data(154,3:qa))/PITA;
% Mexico 183 168
PMEX=129;
AMEX=transpose(A.data(184,3:qa))/PMEX;
BMEX=transpose(B.data(184,3:qa))/PMEX;
% Spain 235 220
PESP=46.8;
AESP=transpose(A.data(238,3:qa))/PESP;
BESP=transpose(B.data(238,3:qa))/PESP;
% United Staes 251 236
PUSA=331;
AUSA=transpose(A.data(255,3:qa))/PUSA;
BUSA=transpose(B.data(255,3:qa))/PUSA;
% United Kingdom 266 251
PGBR=67.9;
AGBR=transpose(A.data(270,3:qa))/PGBR;
BGBR=transpose(B.data(270,3:qa))/PGBR;

newcolors = [0 0 0; 
             0 1 0; 
             0 0 1; 
             1 0 0; 
             0 1 1; 
             1 0 1;
             0.85 0.325 0.098; 
             1 0.54 0; 
             0.47 0.25 0.8; 
             0.25 0.8 0.54];
colororder(newcolors)         
% plot
subplot(2,3,1)
plot([JPN1,TKY1,OSK1,OKNW1,HYG1,HKD1,KNG1,STM1,CHB1,KYT1],'LineWidth',2)
title('COVID-19 in Japan (total cases per 1M)','data sourced by NHK (Japan Broadcasting Corporation)')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Osaka','Okinawa','Hyogo','Hokkaido','Kanagawa','Saitama','Chiba','Kyoto','Location','northwest');
% plot
subplot(2,3,4)
plot([JPN2,TKY2,OSK2,OKNW2,HYG2,HKD2,KNG2,STM2,CHB2,KYT2],'LineWidth',2)
title('COVID-19 in Japan (death toll per 1M)','data sourced by NHK (Japan Broadcasting Corporation)')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Osaka','Okinawa','Hyogo','Hokkaido','Kanagawa','Saitama','Chiba','Kyoto','Location','northwest');
subplot(2,3,2)
plot([AJPN,APHI,AMYS,AIDN,AKOR,AIND,ANPL,APAK,ABGD,ALKA],'LineWidth',2)
title('COVID-19 in Asia (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD]);
xticklabels({[L0],[L1],[L2],[L3]});
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Location','northwest');
% plot
subplot(2,3,5)
plot([BJPN,BPHI,BMYS,BIDN,BKOR BIND BNPL BPAK BBGD BLKA],'LineWidth',2)
title('COVID-19 in Asia (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD]);
xticklabels({[L0],[L1],[L2],[L3]});
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Location','northwest');
% plot
subplot(2,3,3)
plot([AARG,ABRA,ACOL,AFRA,AITA,AMEX,AESP,AUSA,AGBR],'LineWidth',2)
title('COVID-19 in the World (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD]);
xticklabels({[L0],[L1],[L2],[L3]});
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
% plot
subplot(2,3,6)
plot([BARG,BBRA,BCOL,BFRA,BITA,BMEX,BESP,BUSA,BGBR],'LineWidth',2)
title('COVID-19 in the World (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD]);
xticklabels({[L0],[L1],[L2],[L3]});
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
