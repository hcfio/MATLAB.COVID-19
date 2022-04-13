websave('./csv/jhu_cases.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
W=importdata('./csv/jhu_cases.csv');
[pw qw]=size(W.data);
websave('./csv/jhu_deaths.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
U=importdata('./csv/jhu_deaths.csv');
[pu qu]=size(U.data);

DD=qw-712;
dd0=datetime(2022,1,1);
dd1=dd0+days(DD-1);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/3)),'yyyy-mm-dd');
ll2=datestr(dd0+days(floor(2*(DD-1)/3)),'yyyy-mm-dd');
ll3=datestr(dd1,'yyyy-mm-dd');

% Argentina
PARG=45.870820;
WARG=transpose(W.data(8,3:qw))/PARG;
ARG=zeros(DD,1);
for j=1:DD
    ARG(j,1)=max(0,WARG(j+710,1)-WARG(j+703,1))/7;
end
UARG=transpose(U.data(8,3:qu))/PARG;
DEARG=zeros(DD,1);
for j=1:DD
    DEARG(j,1)=max(0,UARG(j+710,1)-UARG(j+703,1))/7;
end

% NSW
PNSW=8.21;
WNSW=transpose(W.data(11,3:qw))/PNSW;
NSW=zeros(DD,1);
for j=1:DD
    NSW(j,1)=max(0,WNSW(j+710,1)-WNSW(j+703,1))/7;
end

% Victoria
PVIC=6.64;
WVIC=transpose(W.data(16,3:qw))/PVIC;
VIC=zeros(DD,1);
for j=1:DD
    VIC(j,1)=max(0,WVIC(j+710,1)-WVIC(j+703,1))/7;
end

% Australia
PAUS=25.981402;
WACT=transpose(W.data(10,3:qw));
WNSW=transpose(W.data(11,3:qw));
WNT=transpose(W.data(12,3:qw));
WQLD=transpose(W.data(13,3:qw));
WSA=transpose(W.data(14,3:qw));
WTAS=transpose(W.data(15,3:qw));
WVIC=transpose(W.data(16,3:qw));
WWA=transpose(W.data(17,3:qw));
WAUS=(WACT+WNSW+WNT+WQLD+WSA+WTAS+WVIC+WWA)/PAUS;
AUS=zeros(DD,1);
for j=1:DD
    AUS(j,1)=max(0,WAUS(j+710,1)-WAUS(j+703,1))/7;
end
UACT=transpose(U.data(10,3:qw));
UNSW=transpose(U.data(11,3:qw));
UNT=transpose(U.data(12,3:qw));
UQLD=transpose(U.data(13,3:qw));
USA=transpose(U.data(14,3:qw));
UTAS=transpose(U.data(15,3:qw));
UVIC=transpose(U.data(16,3:qw));
UWA=transpose(U.data(17,3:qw));
UAUS=(UACT+UNSW+UNT+UQLD+USA+UTAS+UVIC+UWA)/PAUS;
DEAUS=zeros(DD,1);
for j=1:DD
    DEAUS(j,1)=max(0,UAUS(j+710,1)-UAUS(j+703,1))/7;
end


% Brazil
PBRA=215.019011;
UBRA=transpose(U.data(32,3:qu))/PBRA;
DEBRA=zeros(DD,1);
for j=1:DD
    DEBRA(j,1)=max(0,UBRA(j+710,1)-UBRA(j+703,1))/7;
end

% Brunei Darussalam
PBWN=0.4435;
WBWN=transpose(W.data(33,3:qw))/PBWN;
BWN=zeros(DD,1);
for j=1:DD
    BWN(j,1)=max(0,WBWN(j+710,1)-WBWN(j+703,1))/7;
end
UBWN=transpose(U.data(33,3:qu))/PBWN;
DEBWN=zeros(DD,1);
for j=1:DD
    DEBWN(j,1)=max(0,UBWN(j+710,1)-UBWN(j+703,1))/7;
end

% Hong Kong 
PHKG=7.600852;
WHKG=transpose(W.data(72,3:qw))/PHKG;
HKG=zeros(DD,1);
for j=1:DD
    HKG(j,1)=max(0,WHKG(j+710,1)-WHKG(j+703,1))/7;
end
UHKG=transpose(U.data(72,3:qu))/PHKG;
DEHKG=zeros(DD,1);
for j=1:DD
    DEHKG(j,1)=max(0,UHKG(j+710,1)-UHKG(j+703,1))/7;
end

% France Italy Spain 
PFRA=65.508662;
PITA=60.317073;
PESP=46.784213;
PFIE=PFRA+PITA+PESP;
WFRA=transpose(W.data(132,3:qw));
WITA=transpose(W.data(155,3:qw));
WESP=transpose(W.data(239,3:qw));
WFIE=(WFRA+WITA+WESP)/PFIE;
FIE=zeros(DD,1);
for j=1:DD
    FIE(j,1)=max(0,WFIE(j+710,1)-WFIE(j+703,1))/7;
end
UFRA=transpose(U.data(132,3:qw));
UITA=transpose(U.data(155,3:qw));
UESP=transpose(U.data(239,3:qw));
UFIE=(UFRA+UITA+UESP)/PFIE;
DEFIE=zeros(DD,1);
for j=1:DD
    DEFIE(j,1)=max(0,UFIE(j+710,1)-UFIE(j+703,1))/7;
end

% India
PIND=1402.124607;
WIND=transpose(W.data(149,3:qw))/PIND;
IND=zeros(DD,1);
for j=1:DD
    IND(j,1)=max(0,WIND(j+710,1)-WIND(j+703,1))/7;
end
UIND=transpose(U.data(149,3:qu))/PIND;
DEIND=zeros(DD,1);
for j=1:DD
    DEIND(j,1)=max(0,UIND(j+710,1)-UIND(j+703,1))/7;
end

% Indonesia
PIDN=278.239007;
WIDN=transpose(W.data(150,3:qw))/PIDN;
IDN=zeros(DD,1);
for j=1:DD
    IDN(j,1)=max(0,WIDN(j+710,1)-WIDN(j+703,1))/7;
end
UIDN=transpose(U.data(150,3:qu))/PIDN;
DEIDN=zeros(DD,1);
for j=1:DD
    DEIDN(j,1)=max(0,UIDN(j+710,1)-UIDN(j+703,1))/7;
end

% Japan
PJPN=125.845010;
WJPN=transpose(W.data(157,3:qw))/PJPN;
JPN=zeros(DD,1);
for j=1:DD
    JPN(j,1)=max(0,WJPN(j+710,1)-WJPN(j+703,1))/7;
end
UJPN=transpose(U.data(157,3:qu))/PJPN;
DEJPN=zeros(DD,1);
for j=1:DD
    DEJPN(j,1)=max(0,UJPN(j+710,1)-UJPN(j+703,1))/7;
end

% South Korea
PKOR=51.341022;
WKOR=transpose(W.data(162,3:qw))/PKOR;
KOR=zeros(DD,1);
for j=1:DD
    KOR(j,1)=max(0,WKOR(j+710,1)-WKOR(j+703,1))/7;
end
UKOR=transpose(U.data(157,3:qu))/PKOR;
DEKOR=zeros(DD,1);
for j=1:DD
    DEKOR(j,1)=max(0,UKOR(j+710,1)-UKOR(j+703,1))/7;
end

% Malaysia
PMYS=33.060794;
WMYS=transpose(W.data(178,3:qw))/PMYS;
MYS=zeros(DD,1);
for j=1:DD
    MYS(j,1)=max(0,WMYS(j+710,1)-WMYS(j+703,1))/7;
end
UMYS=transpose(U.data(178,3:qu))/PMYS;
DEMYS=zeros(DD,1);
for j=1:DD
    DEMYS(j,1)=max(0,UMYS(j+710,1)-UMYS(j+703,1))/7;
end

% Mexico
PMEX=131.137507;
UMEX=transpose(U.data(185,3:qu))/PMEX;
DEMEX=zeros(DD,1);
for j=1:DD
    DEMEX(j,1)=max(0,UMEX(j+710,1)-UMEX(j+703,1))/7;
end

% New Zealand
PNZ1=0.017593;
PNZ2=4.892946;
PNZL=PNZ1+PNZ2;
WNZ1=transpose(W.data(200,3:qw));
WNZ2=transpose(W.data(201,3:qw));
WNZL=(WNZ1+WNZ2)/PNZL;
NZL=zeros(DD,1);
for j=1:DD
    NZL(j,1)=max(0,WNZL(j+710,1)-WNZL(j+703,1))/7;
end


% Philippines
PPHI=112.027348;
WPHI=transpose(W.data(214,3:qw))/PPHI;
PHI=zeros(DD,1);
for j=1:DD
    PHI(j,1)=max(0,WPHI(j+710,1)-WPHI(j+703,1))/7;
end
UIDN=transpose(U.data(214,3:qu))/PIDN;
DEIDN=zeros(DD,1);
for j=1:DD
    DEIDN(j,1)=max(0,UIDN(j+710,1)-UIDN(j+703,1))/7;
end

% Russia
PRUS=146.036343;
WRUS=transpose(W.data(219,3:qw))/PRUS;
RUS=zeros(DD,1);
for j=1:DD
    RUS(j,1)=max(0,WRUS(j+710,1)-WRUS(j+703,1))/7;
end
URUS=transpose(U.data(219,3:qu))/PRUS;
DERUS=zeros(DD,1);
for j=1:DD
    DERUS(j,1)=max(0,URUS(j+710,1)-URUS(j+703,1))/7;
end

% Singapore
PSIN=5.925237;
WSIN=transpose(W.data(232,3:qw))/PSIN;
SIN=zeros(DD,1);
for j=1:DD
    SIN(j,1)=max(0,WSIN(j+710,1)-WSIN(j+703,1))/7;
end
USIN=transpose(U.data(232,3:qu))/PSIN;
DESIN=zeros(DD,1);
for j=1:DD
    DESIN(j,1)=max(0,USIN(j+710,1)-USIN(j+703,1))/7;
end

% Sri Lanka
PLKA=21.559415;
WLKA=transpose(W.data(240,3:qw))/PLKA;
LKA=zeros(DD,1);
for j=1:DD
    LKA(j,1)=max(0,WLKA(j+710,1)-WLKA(j+703,1))/7;
end
ULKA=transpose(U.data(240,3:qu))/PLKA;
DELKA=zeros(DD,1);
for j=1:DD
    DELKA(j,1)=max(0,ULKA(j+710,1)-ULKA(j+703,1))/7;
end

% Thailand
PTHA=70.085127;
WTHA=transpose(W.data(250,3:qw))/PTHA;
THA=zeros(DD,1);
for j=1:DD
    THA(j,1)=max(0,WTHA(j+710,1)-WTHA(j+703,1))/7;
end
UTHA=transpose(U.data(250,3:qu))/PTHA;
DETHA=zeros(DD,1);
for j=1:DD
    DETHA(j,1)=max(0,UTHA(j+710,1)-UTHA(j+703,1))/7;
end

% United Staes
PUSA=334.207212;
WUSA=transpose(W.data(257,3:qw))/PUSA;
USA=zeros(DD,1);
for j=1:DD
    USA(j,1)=max(0,WUSA(j+710,1)-WUSA(j+703,1))/7;
end
UUSA=transpose(U.data(257,3:qu))/PUSA;
DEUSA=zeros(DD,1);
for j=1:DD
    DEUSA(j,1)=max(0,UUSA(j+710,1)-UUSA(j+703,1))/7;
end

% United Kingdom
PGBR=68.466544;
WGBR=transpose(W.data(274,3:qw))/PGBR;
GBR=zeros(DD,1);
for j=1:DD
    GBR(j,1)=max(0,WGBR(j+710,1)-WGBR(j+703,1))/7;
end
UGBR=transpose(U.data(274,3:qu))/PGBR;
DEGBR=zeros(DD,1);
for j=1:DD
    DEGBR(j,1)=max(0,UGBR(j+710,1)-UGBR(j+703,1))/7;
end

% Vietnam
PVNM=98.953541;
WVNM=transpose(W.data(279,3:qw))/PVNM;
VNM=zeros(DD,1);
for j=1:DD
    VNM(j,1)=max(0,WVNM(j+710,1)-WVNM(j+703,1))/7;
end
    
websave("./csv/mhlw_cases.csv","https://covid19.mhlw.go.jp/public/opendata/confirmed_cases_cumulative_daily.csv");
websave("./csv/mhlw_deaths.csv","https://covid19.mhlw.go.jp/public/opendata/deaths_cumulative_daily.csv");
XC=importdata("./csv/mhlw_cases.csv");
XD=importdata("./csv/mhlw_deaths.csv");
VC=XC.data(:,:);
VD=XD.data(:,:);

% Okinawa (1.46M): code 47
POKNW=1.469335;    
OKNW1=VC(:,48)/POKNW;
OKNW2=VD(:,48)/POKNW;
OKNW=zeros(DD,1);
for j=1:DD
    OKNW(j,1)=(OKNW1(j+602,1)-OKNW1(j+595,1))/7;
end
DEOKNW=zeros(DD,1);
for j=1:DD
    DEOKNW(j,1)=(OKNW2(j+602,1)-OKNW2(j+595,1))/7;
end

% Tokyo (14M): code 13, 
PTKY=13.988129;
TKY1=VC(:,14)/PTKY;
TKY=zeros(DD,1);
for j=1:DD
    TKY(j,1)=(TKY1(j+602,1)-TKY1(j+595,1))/7;
end

% Osaka: code 28
POSK=8.797153;
OSK1=VC(:,28)/POSK;
OSK2=VD(:,28)/POSK;
OSK=zeros(DD,1);
for j=1:DD
    OSK(j,1)=(OSK1(j+602,1)-OSK1(j+595,1))/7;
end
DEOSK=zeros(DD,1);
for j=1:DD
    DEOSK(j,1)=(OSK2(j+602,1)-OSK2(j+595,1))/7;
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
d0=datetime(2021,8,1);
d1=DATEBWN+caldays(DBWN+16);
D=1+days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor((D-1)/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*(D-1)/3)),'yyyy-mm-dd');
l3=datestr(d1,'yyyy-mm-dd');
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
plot([HKG,AUS,OKNW,NZL,KOR,VNM,BWN,NSW,VIC,SIN],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU and MoH of Japan')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD])
xticklabels({[ll0],[ll1],[ll2],[ll3]})
legend('Hong Kong','Australia','Okinawa','New Zealand','South Korea','Vietnam','Brunei','New South Wales','Victoria','Singapore','Location','northwest');
%
subplot(2,2,2)
plot([JPN,TKY,OKNW,OSK],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU and MoH of Japan')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD])
xticklabels({[ll0],[ll1],[ll2],[ll3]})
legend('Japan','Tokyo','Okinawa','Osaka','Location','northwest');
%
subplot(2,2,3)
plot([VJPN,VMYS,VPHI,VIDN,VTHA,VVNM,VBWN,VUSA,VCHN,VSIN],'LineWidth',2)
title('COVID-19: fully vaccinated','data sourced by JHU Centers for CIVIC Impact')
xlabel('date');
ylabel('%');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Japan','Malaysia','Philippines','Indonesia','Thailand','Vietnam','Brunei','United States','China','Singapore','Location','northwest');
%
subplot(2,2,4)
plot([DEJPN,DEAUS,DEUSA,DEOSK,DEKOR,DEGBR,DEBWN,DERUS,DEBRA,DESIN],'LineWidth',2)
title('COVID-19: 7-day average of deaths per 1M','data sourced by JHU and MoH of Japan')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/3) floor(2*DD/3) DD])
xticklabels({[ll0],[ll1],[ll2],[ll3]})
legend('Japan','Australia','United States','Osaka','South Korea','United Kingdom','Brunei','Russia','Brazil','Singapore','Location','northwest');
%
set(gcf,'Position',[600,200,1200,800]);
saveas(gcf,'crisis.png');
