websave('./csv/jhu_cases.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
W=importdata('./csv/jhu_cases.csv');
[pw qw]=size(W.data);
websave('./csv/jhu_deaths.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
U=importdata('./csv/jhu_deaths.csv');
[pu qu]=size(U.data);

DD=qw-528;
dd0=datetime(2021,7,1);
dd1=dd0+days(DD-1);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(dd1,'yyyy-mm-dd');

% Argentina
PARG=45.672715;
UARG=transpose(U.data(7,3:qu))/PARG;
DEARG=zeros(DD,1);
for j=1:DD
    DEARG(j,1)=max(0,UARG(j+526,1)-UARG(j+519,1))/7;
end

% NSW
PNSW=8.196;
WNSW=transpose(W.data(10,3:qw))/PNSW;
NSW=zeros(DD,1);
for j=1:DD
    NSW(j,1)=max(0,WNSW(j+526,1)-WNSW(j+519,1))/7;
end

% Victoria
PVIC=6.7;
WVIC=transpose(W.data(15,3:qw))/PVIC;
VIC=zeros(DD,1);
for j=1:DD
    VIC(j,1)=max(0,WVIC(j+526,1)-WVIC(j+519,1))/7;
end

% Brazil
PBRA=214.289417;
UBRA=transpose(U.data(31,3:qu))/PBRA;
DEBRA=zeros(DD,1);
for j=1:DD
    DEBRA(j,1)=max(0,UBRA(j+526,1)-UBRA(j+519,1))/7;
end

% Brunei Darussalam
PBWN=0.442205;
WBWN=transpose(W.data(32,3:qw))/PBWN;
BWN=zeros(DD,1);
for j=1:DD
    BWN(j,1)=max(0,WBWN(j+526,1)-WBWN(j+519,1))/7;
end

% Indonesia
PIDN=276.833206;
WIDN=transpose(W.data(149,3:qw))/PIDN;
IDN=zeros(DD,1);
for j=1:DD
    IDN(j,1)=max(0,WIDN(j+526,1)-WIDN(j+519,1))/7;
end
UIDN=transpose(U.data(149,3:qu))/PIDN;
DEIDN=zeros(DD,1);
for j=1:DD
    DEIDN(j,1)=max(0,UIDN(j+526,1)-UIDN(j+519,1))/7;
end

% Israel
PISR=8.814662;
WISR=transpose(W.data(153,3:qw))/PISR;
ISR=zeros(DD,1);
for j=1:DD
    ISR(j,1)=max(0,WISR(j+526,1)-WISR(j+519,1))/7;
end
UISR=transpose(U.data(153,3:qu))/PISR;
DEISR=zeros(DD,1);
for j=1:DD
    DEISR(j,1)=max(0,UISR(j+526,1)-UISR(j+519,1))/7;
end

% Japan
PJPN=125.36;
WJPN=transpose(W.data(156,3:qw))/PJPN;
JPN=zeros(DD,1);
for j=1:DD
    JPN(j,1)=max(0,WJPN(j+526,1)-WJPN(j+519,1))/7;
end

% South Korea
PKOR=51.318552;
WKOR=transpose(W.data(161,3:qw))/PKOR;
KOR=zeros(DD,1);
for j=1:DD
    KOR(j,1)=max(0,WKOR(j+526,1)-WKOR(j+519,1))/7;
end

% Malaysia
PMYS=32.66;
WMYS=transpose(W.data(177,3:qw))/PMYS;
MYS=zeros(DD,1);
for j=1:DD
    MYS(j,1)=max(0,WMYS(j+526,1)-WMYS(j+519,1))/7;
end
UMYS=transpose(U.data(177,3:qu))/PMYS;
DEMYS=zeros(DD,1);
for j=1:DD
    DEMYS(j,1)=max(0,UMYS(j+526,1)-UMYS(j+519,1))/7;
end

% Mexico
PMEX=130.482814;
UMEX=transpose(U.data(184,3:qu))/PMEX;
DEMEX=zeros(DD,1);
for j=1:DD
    DEMEX(j,1)=max(0,UMEX(j+526,1)-UMEX(j+519,1))/7;
end

% Peru
PPER=33.525950;
UPER=transpose(U.data(212,3:qu))/PPER;
DEPER=zeros(DD,1);
for j=1:DD
    DEPER(j,1)=max(0,UPER(j+526,1)-UPER(j+519,1))/7;
end

% Philippines
PPHI=111.249116;
WPHI=transpose(W.data(213,3:qw))/PPHI;
PHI=zeros(DD,1);
for j=1:DD
    PHI(j,1)=max(0,WPHI(j+526,1)-WPHI(j+519,1))/7;
end
UIDN=transpose(U.data(213,3:qu))/PIDN;
DEIDN=zeros(DD,1);
for j=1:DD
    DEIDN(j,1)=max(0,UIDN(j+526,1)-UIDN(j+519,1))/7;
end

% Singapore
PSIN=5.902011;
WSIN=transpose(W.data(231,3:qw))/PSIN;
SIN=zeros(DD,1);
for j=1:DD
    SIN(j,1)=max(0,WSIN(j+526,1)-WSIN(j+519,1))/7;
end

% Sri Lanka
PLKA=21.516097;
WLKA=transpose(W.data(239,3:qw))/PLKA;
LKA=zeros(DD,1);
for j=1:DD
    LKA(j,1)=max(0,WLKA(j+526,1)-WLKA(j+519,1))/7;
end
ULKA=transpose(U.data(239,3:qu))/PLKA;
DELKA=zeros(DD,1);
for j=1:DD
    DELKA(j,1)=max(0,ULKA(j+526,1)-ULKA(j+519,1))/7;
end

% Thailand
PTHA=70.000662;
WTHA=transpose(W.data(249,3:qw))/PTHA;
THA=zeros(DD,1);
for j=1:DD
    THA(j,1)=max(0,WTHA(j+526,1)-WTHA(j+519,1))/7;
end
UTHA=transpose(U.data(249,3:qu))/PTHA;
DETHA=zeros(DD,1);
for j=1:DD
    DETHA(j,1)=max(0,UTHA(j+526,1)-UTHA(j+519,1))/7;
end
% United Staes 251 236
PUSA=333.225477;
WUSA=transpose(W.data(255,3:qw))/PUSA;
USA=zeros(DD,1);
for j=1:DD
    USA(j,1)=max(0,WUSA(j+526,1)-WUSA(j+519,1))/7;
end
UUSA=transpose(U.data(255,3:qu))/PUSA;
DEUSA=zeros(DD,1);
for j=1:DD
    DEUSA(j,1)=max(0,UUSA(j+526,1)-UUSA(j+519,1))/7;
end

% United Kingdom 266 251
PGBR=68.294438;
WGBR=transpose(W.data(270,3:qw))/PGBR;
GBR=zeros(DD,1);
for j=1:DD
    GBR(j,1)=max(0,WGBR(j+526,1)-WGBR(j+519,1))/7;
end
UGBR=transpose(U.data(270,3:qu))/PGBR;
DEGBR=zeros(DD,1);
for j=1:DD
    DEGBR(j,1)=max(0,UGBR(j+526,1)-UGBR(j+519,1))/7;
end

% Vietnam
PVNM=98.341025;
WVNM=transpose(W.data(275,3:qw))/PVNM;
VNM=zeros(DD,1);
for j=1:DD
    VNM(j,1)=max(0,WVNM(j+526,1)-WVNM(j+519,1))/7;
end
    
websave('./csv/nhk_prefectures.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('./csv/nhk_prefectures.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

% Okinawa (1.46M): code 47
POKNW=1.458870;
rowoknw=find(B(:)==47);
OKNW1=A.data(rowoknw,2)/POKNW;
OKNW=zeros(DD,1);
for j=1:DD
    OKNW(j,1)=(OKNW1(j+532,1)-OKNW1(j+525,1))/7;
end

% Tokyo (14M): code 13, 
PTKY=14.049146;
rowtky=find(B(:)==13);
TKY1=A.data(rowtky,2)/PTKY;
TKY=zeros(DD,1);
for j=1:DD
    TKY(j,1)=(TKY1(j+532,1)-TKY1(j+525,1))/7;
end

websave('./csv/jhu_vaccinated.csv','https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_global.csv');
V=readmatrix('./csv/jhu_vaccinated.csv');
[m n]=size(V);
UID=V(:,7);
VAC=V(:,5);

% Brunei Darussalam
PBWN=4422.05;
ROWBWN=find(UID(:)==96);
VACBWN=VAC(ROWBWN)/PBWN;
DBWN=length(VACBWN);
DATEBWN=datetime(2021,4,2);
d0=datetime(2021,7,1);
d1=DATEBWN+caldays(DBWN+16);
D=1+days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor((D-1)/2)),'yyyy-mm-dd');
l2=datestr(d1,'yyyy-mm-dd');
VBWN=VACBWN(DBWN-D+1:DBWN);


% China
PCHN=14460554.93;
ROWCHN=find(UID(:)==156);
VACCHN=VAC(ROWCHN)/PCHN;
DCHN=length(VACCHN);
VCHN=VACCHN(DCHN-D+1:DCHN);

% Indonesia
PIDN=2768332.06;
ROWIDN=find(UID(:)==360);
VACIDN=VAC(ROWIDN)/PIDN;
DIDN=length(VACIDN);
VIDN=VACIDN(DIDN-D+1:DIDN);

% Japan
PJPN=1253600;
ROWJPN=find(UID(:)==392);
VACJPN=VAC(ROWJPN)/PJPN;
DJPN=length(VACJPN);
VJPN=VACJPN(DJPN-D+1:DJPN);

% Malaysia
PMYS=326600;
ROWMYS=find(UID(:)==458);
VACMYS=VAC(ROWMYS)/PMYS;
DMYS=length(VACMYS);
VMYS=VACMYS(DMYS-D+1:DMYS);

% Philippines
PPHI=1112491.16;
ROWPHI=find(UID(:)==608);
VACPHI=VAC(ROWPHI)/PPHI;
DPHI=length(VACPHI);
VPHI=VACPHI(DPHI-D+1:DPHI);

% Singapore
PSIN=59020.11;
ROWSIN=find(UID(:)==702);
VACSIN=VAC(ROWSIN)/PSIN;
DSIN=length(VACSIN);
VSIN=VACSIN(DSIN-D+1:DSIN);

% Vietnam
PVNM=983405.93;
ROWVNM=find(UID(:)==704);
VACVNM=VAC(ROWVNM)/PVNM;
DVNM=length(VACVNM);
VVNM=VACVNM(DVNM-D+1:DVNM);

% Thailand
PTHA=700006.62;
ROWTHA=find(UID(:)==764);
VACTHA=VAC(ROWTHA)/PTHA;
DTHA=length(VACTHA);
VTHA=VACTHA(DTHA-D+1:DTHA);

% United Staes 
PUSA=3332254.77;
ROWUSA=find(UID(:)==840);
VACUSA=VAC(ROWUSA)/PUSA;
DUSA=length(VACUSA);
VUSA=VACUSA(DUSA-D+1:DUSA);



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
plot([USA,PHI,OKNW,MYS,THA,BWN,NSW,LKA,ISR,GBR],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU and NHK')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('United States','Philippines','Okinawa','Malaysia','Thailand','Brunei','New South Wales','Sri Lanka','Israel','United Kingdom','Location','northwest');
%
subplot(2,2,2)
plot([JPN,TKY,SIN,KOR,VNM,VIC,IDN],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('Japan','Tokyo','Singapore','South Korea','Vietnam','Victoria','Indonesia','Location','northwest');
%
subplot(2,2,3)
plot([VJPN,VPHI,VBWN,VCHN,VIDN,VMYS,VSIN,VTHA,VVNM,VUSA],'LineWidth',2)
title('COVID-19: fully vaccinated','data sourced by JHU Centers for CIVIC Impact')
xlabel('date');
ylabel('%');
xticks([1 floor(D/2) D])
xticklabels({[l0],[l1],[l2]})
legend('Japan','Philippines','Brunei','China','Indonesia','Malaysia','Singapore','Thailand','Vietnam','United States','Location','northwest');
%
subplot(2,2,4)
plot([DEARG,DEBRA,DEIDN,DEMYS,DEMEX,DEPER,DELKA,DETHA,DEUSA,DEISR],'LineWidth',2)
title('COVID-19: 7-day average of deaths per 1M','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('Argentina','Brazil','Indonesia','Malaysia','Mexico','Peru','Sri Lanka','Thailand','United States','Israel','Location','northwest');
set(gcf,'Position',[600,200,1200,800]);
saveas(gcf,'crisis.png');
