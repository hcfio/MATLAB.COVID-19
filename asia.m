websave('./csv/jhu_cases.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
websave('./csv/jhu_deaths.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
% websave('./csv/time_series_covid19_recovered_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv');

A=importdata('./csv/jhu_cases.csv');
B=importdata('./csv/jhu_deaths.csv');
% C=importdata('./csv/time_series_covid19_recovered_global.csv');
[pw qw]=size(A.data);

D=qw-2;
d0=datetime(2020,1,22);
d1=d0+days(D-1);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor(D/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*D/3)),'yyyy-mm-dd');
l3=datestr(d1,'yyyy-mm-dd');

DD=qw-528;
dd0=datetime('2021-07-01');
dd1=dd0+days(DD-1);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/2)),['yyyy-mm-dd']);
ll2=datestr(dd1,'yyyy-mm-dd');

% Bangladesh
PBGD=166.567052;
ABGD=transpose(A.data(22,3:qw))/PBGD;
BBGD=transpose(B.data(22,3:qw))/PBGD;
NBGD=zeros(D,1);
for j=1:7
    NBGD(j,1)=ABGD(j,1)/j;
end
for j=8:D
    NBGD(j,1)=max(0,ABGD(j,1)-ABGD(j-7,1))/7;
end
NDBGD=zeros(D,1);
for j=1:7
    NDBGD(j,1)=BBGD(j,1)/7;
end
for j=8:D
    NDBGD(j,1)=(BBGD(j,1)-BBGD(j-7,1))/7;
end

% India
PIND=1395.531433;
AIND=transpose(A.data(149,3:qw))/PIND;
BIND=transpose(B.data(149,3:qw))/PIND;
NIND=zeros(D,1);
for j=1:7
    NIND(j,1)=AIND(j,1)/j;
end
for j=8:D
    NIND(j,1)=max(0,AIND(j,1)-AIND(j-7,1))/7;
end
NDIND=zeros(D,1);
for j=1:7
    NDIND(j,1)=BIND(j,1)/7;
end
for j=8:D
    NDIND(j,1)=(BIND(j,1)-BIND(j-7,1))/7;
end

% Indonesia
PIDN=276.833206;
AIDN=transpose(A.data(150,3:qw))/PIDN;
BIDN=transpose(B.data(150,3:qw))/PIDN;
NIDN=zeros(D,1);
for j=1:7
    NIDN(j,1)=AIDN(j,1)/j;
end
for j=8:D
    NIDN(j,1)=max(0,AIDN(j,1)-AIDN(j-7,1))/7;
end
NDIDN=zeros(D,1);
for j=1:7
    NDIDN(j,1)=BIDN(j,1)/7;
end
for j=8:D
    NDIDN(j,1)=(BIDN(j,1)-BIDN(j-7,1))/7;
end

% Japwn
PJPN=126.032481;
AJPN=transpose(A.data(157,3:qw))/PJPN;
BJPN=transpose(B.data(157,3:qw))/PJPN;
NJPN=zeros(D,1);
for j=1:7
    NJPN(j,1)=AJPN(j,1)/j;
end
for j=8:D
    NJPN(j,1)=max(0,AJPN(j,1)-AJPN(j-7,1))/7;
end
NDJPN=zeros(D,1);
for j=1:7
    NDJPN(j,1)=BJPN(j,1)/7;
end
for j=8:D
    NDJPN(j,1)=(BJPN(j,1)-BJPN(j-7,1))/7;
end

% South Korea
PKOR=51.319753;
AKOR=transpose(A.data(162,3:qw))/PKOR;
BKOR=transpose(B.data(162,3:qw))/PKOR;
NKOR=zeros(D,1);
for j=1:7
    NKOR(j,1)=AKOR(j,1)/j;
end
for j=8:D
    NKOR(j,1)=max(0,AKOR(j,1)-AKOR(j-7,1))/7;
end
NDKOR=zeros(D,1);
for j=1:7
    NDKOR(j,1)=BKOR(j,1)/7;
end
for j=8:D
    NDKOR(j,1)=(BKOR(j,1)-BKOR(j-7,1))/7;
end

% Malaysia
PMYS=32.7;
AMYS=transpose(A.data(178,3:qw))/PMYS;
BMYS=transpose(B.data(178,3:qw))/PMYS;
NMYS=zeros(D,1);
for j=1:7
    NMYS(j,1)=AMYS(j,1)/j;
end
for j=8:D
    NMYS(j,1)=max(0,AMYS(j,1)-AMYS(j-7,1))/7;
end
NDMYS=zeros(D,1);
for j=1:7
    NDMYS(j,1)=BMYS(j,1)/7;
end
for j=8:D
    NDMYS(j,1)=(BMYS(j,1)-BMYS(j-7,1))/7;
end

% Nepwl
PNPL=29.735589;
ANPL=transpose(A.data(194,3:qw))/PNPL;
BNPL=transpose(B.data(194,3:qw))/PNPL;
NNPL=zeros(D,1);
for j=1:7
    NNPL(j,1)=ANPL(j,1)/j;
end
for j=8:D
    NNPL(j,1)=max(0,ANPL(j,1)-ANPL(j-7,1))/7;
end
NDNPL=zeros(D,1);
for j=1:7
    NDNPL(j,1)=BNPL(j,1)/7;
end
for j=8:D
    NDNPL(j,1)=(BNPL(j,1)-BNPL(j-7,1))/7;
end

% Pakistan
PPAK=225.791619;
APAK=transpose(A.data(208,3:qw))/PPAK;
BPAK=transpose(B.data(208,3:qw))/PPAK;
NPAK=zeros(D,1);
for j=1:7
    NPAK(j,1)=APAK(j,1)/j;
end
for j=8:D
    NPAK(j,1)=max(0,APAK(j,1)-APAK(j-7,1))/7;
end
NDPAK=zeros(D,1);
for j=1:7
    NDPAK(j,1)=BPAK(j,1)/7;
end
for j=8:D
    NDPAK(j,1)=(BPAK(j,1)-BPAK(j-7,1))/7;
end

% Philippines
PPHI=111.249116;
APHI=transpose(A.data(214,3:qw))/PPHI;
BPHI=transpose(B.data(214,3:qw))/PPHI;
NPHI=zeros(D,1);
for j=1:7
    NPHI(j,1)=APHI(j,1)/j;
end
for j=8:D
    NPHI(j,1)=max(0,APHI(j,1)-APHI(j-7,1))/7;
end
NDPHI=zeros(D,1);
for j=1:7
    NDPHI(j,1)=BPHI(j,1)/7;
end
for j=8:D
    NDPHI(j,1)=(BPHI(j,1)-BPHI(j-7,1))/7;
end

% Singapore
PSIN=5.902011;
ASIN=transpose(A.data(232,3:qw))/PSIN;
BSIN=transpose(B.data(232,3:qw))/PSIN;
NSIN=zeros(D,1);
for j=1:7
    NSIN(j,1)=ASIN(j,1)/j;
end
for j=8:D
    NSIN(j,1)=max(0,ASIN(j,1)-ASIN(j-7,1))/7;
end
NDSIN=zeros(D,1);
for j=1:7
    NDSIN(j,1)=BSIN(j,1)/7;
end
for j=8:D
    NDSIN(j,1)=(BSIN(j,1)-BSIN(j-7,1))/7;
end

% Sri Lanka
PLKA=21.516097;
ALKA=transpose(A.data(240,3:qw))/PLKA;
BLKA=transpose(B.data(240,3:qw))/PLKA;
NLKA=zeros(D,1);
for j=1:7
    NLKA(j,1)=ALKA(j,1)/j;
end
for j=8:D
    NLKA(j,1)=max(0,ALKA(j,1)-ALKA(j-7,1))/7;
end
NDLKA=zeros(D,1);
for j=1:7
    NDLKA(j,1)=BLKA(j,1)/7;
end
for j=8:D
    NDLKA(j,1)=(BLKA(j,1)-BLKA(j-7,1))/7;
end

% Thailand
PTHA=70.000662;
ATHA=transpose(A.data(250,3:qw))/PTHA;
BTHA=transpose(B.data(250,3:qw))/PTHA;
NTHA=zeros(D,1);
for j=1:7
    NTHA(j,1)=ATHA(j,1)/j;
end
for j=8:D
    NTHA(j,1)=max(0,ATHA(j,1)-ATHA(j-7,1))/7;
end
NDTHA=zeros(D,1);
for j=1:7
    NDTHA(j,1)=BTHA(j,1)/7;
end
for j=8:D
    NDTHA(j,1)=(BTHA(j,1)-BTHA(j-7,1))/7;
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
plot([AJPN,APHI,AMYS,AIDN,AIND,ANPL,ABGD,ALKA,ATHA,ASIN],'LineWidth',2)
title('COVID-19: cases per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepwl','Bangladesh','Sri Lanka','Thailand','Singapore','Location','northwest');
% plot
subplot(2,2,2)
plot([BJPN,BPHI,BMYS,BIDN,BIND,BNPL,BBGD,BLKA,BTHA,BSIN],'LineWidth',2)
title('COVID-19: deaths per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepwl','Bangladesh','Sri Lanka','Thailand','Singapore','Location','northwest');
% plot
subplot(2,2,3)
plot([NJPN,NPHI,NMYS,NIDN,NIND,NNPL,NBGD,NLKA,NTHA,NSIN],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepwl','Bangladesh','Sri Lanka','Thailand','Singapore','Location','northwest');
% plot
subplot(2,2,4)
plot([NDJPN,NDPHI,NDMYS,NDIDN,NDIND,NDNPL,NDBGD,NDLKA,NDTHA,NDSIN],'LineWidth',2)
title('COVID-19: 7-day average deaths per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Philippines','Malaysia','Indonesia','India','Nepwl','Bangladesh','Sri Lanka','Thailand','Singapore','Location','northwest');
set(gcf,'Position',[600,200,1300,800]);
saveas(gcf,'asia.png');