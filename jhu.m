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
PIND=271;
AIND=transpose(A.data(148,3:qa))/PIND;
BIND=transpose(B.data(148,3:qa))/PIND;

% plot
subplot(1,2,1)
plot([AJPN,APHI,AMYS,AIND,AKOR],'LineWidth',2)
title('COVID-19 in Asia (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','Location','northwest');
% plot
subplot(1,2,2)
plot([BJPN,BPHI,BMYS,BIND,BKOR],'LineWidth',2)
title('COVID-19 in Asia (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','South Korea','Location','northwest');
