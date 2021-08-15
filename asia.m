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

ddd0=datetime('2021-04-01');
L0=string('2021-04-01');
L1=datestr(ddd0+days(floor((D-435)/2)),'yyyy-mm-dd');
L2=datestr(d1,'yyyy-mm-dd');

% Bangladesh
PBGD=165;
ABGD=transpose(A.data(21,3:qa))/PBGD;
BBGD=transpose(B.data(21,3:qa))/PBGD;
NBGD=zeros(qa-2,1);
NBGD(1,1)=ABGD(1,1);
for j=2:qa-2
    NBGD(j,1)=max(ABGD(j,1)-ABGD(j-1,1),0);
end
NDBGD=zeros(qa-437,1);
for j=1:qa-437
    NDBGD(j,1)=(BBGD(j+435,1)-BBGD(j+428,1))/7;
end

% India
PIND=1380;
AIND=transpose(A.data(148,3:qa))/PIND;
BIND=transpose(B.data(148,3:qa))/PIND;
NIND=zeros(qa-2,1);
NIND(1,1)=AIND(1,1);
for j=2:qa-2
    NIND(j,1)=max(AIND(j,1)-AIND(j-1,1),0);
end
NDIND=zeros(qa-437,1);
for j=1:qa-437
    NDIND(j,1)=(BIND(j+435,1)-BIND(j+428,1))/7;
end

% Indonesia
PIDN=271;
AIDN=transpose(A.data(149,3:qa))/PIDN;
BIDN=transpose(B.data(149,3:qa))/PIDN;
NIDN=zeros(qa-2,1);
NIDN(1,1)=AIDN(1,1);
for j=2:qa-2
    NIDN(j,1)=max(AIDN(j,1)-AIDN(j-1,1),0);
end
NDIDN=zeros(qa-437,1);
for j=1:qa-437
    NDIDN(j,1)=(BIDN(j+435,1)-BIDN(j+428,1))/7;
end

% Japan
PJPN=125.36;
AJPN=transpose(A.data(156,3:qa))/PJPN;
BJPN=transpose(B.data(156,3:qa))/PJPN;
NJPN=zeros(qa-2,1);
NJPN(1,1)=AJPN(1,1);
for j=2:qa-2
    NJPN(j,1)=max(AJPN(j,1)-AJPN(j-1,1),0);
end
NDJPN=zeros(qa-437,1);
for j=1:qa-437
    NDJPN(j,1)=(BJPN(j+435,1)-BJPN(j+428,1))/7;
end

% South Korea
PKOR=51.3;
AKOR=transpose(A.data(161,3:qa))/PKOR;
BKOR=transpose(B.data(161,3:qa))/PKOR;
NKOR=zeros(qa-2,1);
NKOR(1,1)=AKOR(1,1);
for j=2:qa-2
    NKOR(j,1)=max(AKOR(j,1)-AKOR(j-1,1),0);
end
NDKOR=zeros(qa-437,1);
for j=1:qa-437
    NDKOR(j,1)=(BKOR(j+435,1)-BKOR(j+428,1))/7;
end

% Malaysia
PMYS=32;
AMYS=transpose(A.data(177,3:qa))/PMYS;
BMYS=transpose(B.data(177,3:qa))/PMYS;
NMYS=zeros(qa-2,1);
NMYS(1,1)=AMYS(1,1);
for j=2:qa-2
    NMYS(j,1)=max(AMYS(j,1)-AMYS(j-1,1),0);
end
NDMYS=zeros(qa-437,1);
for j=1:qa-437
    NDMYS(j,1)=(BMYS(j+435,1)-BMYS(j+428,1))/7;
end

% Nepal
PNPL=29.5;
ANPL=transpose(A.data(193,3:qa))/PNPL;
BNPL=transpose(B.data(193,3:qa))/PNPL;
NNPL=zeros(qa-2,1);
NNPL(1,1)=ANPL(1,1);
for j=2:qa-2
    NNPL(j,1)=max(ANPL(j,1)-ANPL(j-1,1),0);
end
NDNPL=zeros(qa-437,1);
for j=1:qa-437
    NDNPL(j,1)=(BNPL(j+435,1)-BNPL(j+428,1))/7;
end

% Pakistan
PPAK=221;
APAK=transpose(A.data(207,3:qa))/PPAK;
BPAK=transpose(B.data(207,3:qa))/PPAK;
NPAK=zeros(qa-2,1);
NPAK(1,1)=APAK(1,1);
for j=2:qa-2
    NPAK(j,1)=max(APAK(j,1)-APAK(j-1,1),0);
end
NDPAK=zeros(qa-437,1);
for j=1:qa-437
    NDPAK(j,1)=(BPAK(j+435,1)-BPAK(j+428,1))/7;
end

% Philippines
PPHI=108;
APHI=transpose(A.data(213,3:qa))/PPHI;
BPHI=transpose(B.data(213,3:qa))/PPHI;
NPHI=zeros(qa-2,1);
NPHI(1,1)=APHI(1,1);
for j=2:qa-2
    NPHI(j,1)=max(APHI(j,1)-APHI(j-1,1),0);
end
NDPHI=zeros(qa-437,1);
for j=1:qa-437
    NDPHI(j,1)=(BPHI(j+435,1)-BPHI(j+428,1))/7;
end

% Sri Lanka
PLKA=21.5;
ALKA=transpose(A.data(239,3:qa))/PLKA;
BLKA=transpose(B.data(239,3:qa))/PLKA;
NLKA=zeros(qa-2,1);
NLKA(1,1)=ALKA(1,1);
for j=2:qa-2
    NLKA(j,1)=max(ALKA(j,1)-ALKA(j-1,1),0);
end
NDLKA=zeros(qa-437,1);
for j=1:qa-437
    NDLKA(j,1)=(BLKA(j+435,1)-BLKA(j+428,1))/7;
end

% Thailand
PTHA=70;
ATHA=transpose(A.data(249,3:qa))/PTHA;
BTHA=transpose(B.data(249,3:qa))/PTHA;
NTHA=zeros(qa-2,1);
NTHA(1,1)=ATHA(1,1);
for j=2:qa-2
    NTHA(j,1)=max(ATHA(j,1)-ATHA(j-1,1),0);
end
NDTHA=zeros(qa-437,1);
for j=1:qa-437
    NDTHA(j,1)=(BTHA(j+435,1)-BTHA(j+428,1))/7;
end

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
xticks([0 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,2)
plot([BJPN,BPHI,BMYS,BIDN,BIND,BNPL,BPAK,BBGD,BLKA,BTHA],'LineWidth',2)
title('COVID-19 in Asia (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,3)
plot([NJPN,NPHI,NMYS,NIDN,NIND,NNPL,NPAK,NBGD,NLKA,NTHA],'LineWidth',1)
title('COVID-19 in Asia (daily new cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,4)
plot([NDJPN,NDPHI,NDMYS,NDIDN,NDIND,NDNPL,NDPAK,NDBGD,NDLKA,NDTHA],'LineWidth',2)
title('COVID-19 in Asia (7-day average deaths per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor((D-435)/2) D-435])
xticklabels({[L0],[L1],[L2]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepal','Pakistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
