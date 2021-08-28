websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
websave('time_series_covid19_deaths_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
% websave('time_series_covid19_recovered_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv');

A=importdata('time_series_covid19_confirmed_global.csv');
B=importdata('time_series_covid19_deaths_global.csv');
% C=importdata('time_series_covid19_recovered_global.csv');
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
ll1=datestr(dd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(dd1,'yyyy-mm-dd');

% Bangladesh
PBGD=166.567052;
ABGD=transpose(A.data(21,3:qw))/PBGD;
BBGD=transpose(B.data(21,3:qw))/PBGD;
NBGD=zeros(D,1);
for j=1:7
    NBGD(j,1)=ABGD(j,1)/j;
end
for j=8:D
    NBGD(j,1)=max(0,ABGD(j,1)-ABGD(j-7,1))/7;
end
NDBGD=zeros(DD,1);
for j=1:DD
    NDBGD(j,1)=(BBGD(j+526,1)-BBGD(j+519,1))/7;
end

% India
PIND=1395.531433;
AIND=transpose(A.data(148,3:qw))/PIND;
BIND=transpose(B.data(148,3:qw))/PIND;
NIND=zeros(D,1);
for j=1:7
    NIND(j,1)=AIND(j,1)/j;
end
for j=8:D
    NIND(j,1)=max(0,AIND(j,1)-AIND(j-7,1))/7;
end
NDIND=zeros(DD,1);
for j=1:DD
    NDIND(j,1)=(BIND(j+526,1)-BIND(j+519,1))/7;
end

% Indonesia
PIDN=276.833206;
AIDN=transpose(A.data(149,3:qw))/PIDN;
BIDN=transpose(B.data(149,3:qw))/PIDN;
NIDN=zeros(D,1);
for j=1:7
    NIDN(j,1)=AIDN(j,1)/j;
end
for j=8:D
    NIDN(j,1)=max(0,AIDN(j,1)-AIDN(j-7,1))/7;
end
NDIDN=zeros(DD,1);
for j=1:DD
    NDIDN(j,1)=(BIDN(j+526,1)-BIDN(j+519,1))/7;
end

% Japwn
PJPN=126.032481;
AJPN=transpose(A.data(156,3:qw))/PJPN;
BJPN=transpose(B.data(156,3:qw))/PJPN;
NJPN=zeros(D,1);
for j=1:7
    NJPN(j,1)=AJPN(j,1)/j;
end
for j=8:D
    NJPN(j,1)=max(0,AJPN(j,1)-AJPN(j-7,1))/7;
end
NDJPN=zeros(DD,1);
for j=1:DD
    NDJPN(j,1)=(BJPN(j+526,1)-BJPN(j+519,1))/7;
end

% South Korea
PKOR=51.319753;
AKOR=transpose(A.data(161,3:qw))/PKOR;
BKOR=transpose(B.data(161,3:qw))/PKOR;
NKOR=zeros(D,1);
for j=1:7
    NKOR(j,1)=AKOR(j,1)/j;
end
for j=8:D
    NKOR(j,1)=max(0,AKOR(j,1)-AKOR(j-7,1))/7;
end
NDKOR=zeros(DD,1);
for j=1:DD
    NDKOR(j,1)=(BKOR(j+526,1)-BKOR(j+519,1))/7;
end

% Malaysia
PMYS=32.7;
AMYS=transpose(A.data(177,3:qw))/PMYS;
BMYS=transpose(B.data(177,3:qw))/PMYS;
NMYS=zeros(D,1);
for j=1:7
    NMYS(j,1)=AMYS(j,1)/j;
end
for j=8:D
    NMYS(j,1)=max(0,AMYS(j,1)-AMYS(j-7,1))/7;
end
NDMYS=zeros(DD,1);
for j=1:DD
    NDMYS(j,1)=(BMYS(j+526,1)-BMYS(j+519,1))/7;
end

% Nepwl
PNPL=29.735589;
ANPL=transpose(A.data(193,3:qw))/PNPL;
BNPL=transpose(B.data(193,3:qw))/PNPL;
NNPL=zeros(D,1);
for j=1:7
    NNPL(j,1)=ANPL(j,1)/j;
end
for j=8:D
    NNPL(j,1)=max(0,ANPL(j,1)-ANPL(j-7,1))/7;
end
NDNPL=zeros(DD,1);
for j=1:DD
    NDNPL(j,1)=(BNPL(j+526,1)-BNPL(j+519,1))/7;
end

% Pakistan
PPAK=225.791619;
APAK=transpose(A.data(207,3:qw))/PPAK;
BPAK=transpose(B.data(207,3:qw))/PPAK;
NPAK=zeros(D,1);
for j=1:7
    NPAK(j,1)=APAK(j,1)/j;
end
for j=8:D
    NPAK(j,1)=max(0,APAK(j,1)-APAK(j-7,1))/7;
end
NDPAK=zeros(DD,1);
for j=1:DD
    NDPAK(j,1)=(BPAK(j+526,1)-BPAK(j+519,1))/7;
end

% Philippines
PPHI=111.249116;
APHI=transpose(A.data(213,3:qw))/PPHI;
BPHI=transpose(B.data(213,3:qw))/PPHI;
NPHI=zeros(D,1);
for j=1:7
    NPHI(j,1)=APHI(j,1)/j;
end
for j=8:D
    NPHI(j,1)=max(0,APHI(j,1)-APHI(j-7,1))/7;
end
NDPHI=zeros(DD,1);
for j=1:DD
    NDPHI(j,1)=(BPHI(j+526,1)-BPHI(j+519,1))/7;
end

% Sri Lanka
PLKA=21.516097;
ALKA=transpose(A.data(239,3:qw))/PLKA;
BLKA=transpose(B.data(239,3:qw))/PLKA;
NLKA=zeros(D,1);
for j=1:7
    NLKA(j,1)=ALKA(j,1)/j;
end
for j=8:D
    NLKA(j,1)=max(0,ALKA(j,1)-ALKA(j-7,1))/7;
end
NDLKA=zeros(DD,1);
for j=1:DD
    NDLKA(j,1)=(BLKA(j+526,1)-BLKA(j+519,1))/7;
end

% Thailand
PTHA=70.000662;
ATHA=transpose(A.data(249,3:qw))/PTHA;
BTHA=transpose(B.data(249,3:qw))/PTHA;
NTHA=zeros(D,1);
for j=1:7
    NTHA(j,1)=ATHA(j,1)/j;
end
for j=8:D
    NTHA(j,1)=max(0,ATHA(j,1)-ATHA(j-7,1))/7;
end
NDTHA=zeros(DD,1);
for j=1:DD
    NDTHA(j,1)=(BTHA(j+526,1)-BTHA(j+519,1))/7;
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
title('COVID-19: cases per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Japwn','Philippines','Malaysia','Indonesia','India','Nepwl','PAKistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,2)
plot([BJPN,BPHI,BMYS,BIDN,BIND,BNPL,BPAK,BBGD,BLKA,BTHA],'LineWidth',2)
title('COVID-19: deaths per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japwn','Philippines','Malaysia','Indonesia','India','Nepwl','PAKistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,3)
plot([NJPN,NPHI,NMYS,NIDN,NIND,NNPL,NPAK,NBGD,NLKA,NTHA],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japwn','Philippines','Malaysia','Indonesia','India','Nepwl','PAKistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
% plot
subplot(2,2,4)
plot([NDJPN,NDPHI,NDMYS,NDIDN,NDIND,NDNPL,NDPAK,NDBGD,NDLKA,NDTHA],'LineWidth',2)
title('COVID-19: 7-day average deaths per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('Japwn','Philippines','Malaysia','Indonesia','India','Nepwl','PAKistan','Bangladesh','Sri Lanka','Thailand','Location','northwest');
