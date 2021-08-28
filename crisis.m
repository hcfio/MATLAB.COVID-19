websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
W=importdata('time_series_covid19_confirmed_global.csv');
[pw qw]=size(W.data);

DD=qw-528;
dd0=datetime(2021,7,1);
dd1=dd0+days(DD-1);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(dd1,'yyyy-mm-dd');

% NSW
PNSW=8.196;
WNSW=transpose(W.data(10,3:qw))/PNSW;
NSW=zeros(DD,1);
for j=1:DD
    NSW(j,1)=max(0,WNSW(j+526,1)-WNSW(j+519,1))/7;
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

% Philippines
PPHI=111.249116;
WPHI=transpose(W.data(213,3:qw))/PPHI;
PHI=zeros(DD,1);
for j=1:DD
    PHI(j,1)=max(0,WPHI(j+526,1)-WPHI(j+519,1))/7;
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

% Thailand
PTHA=70.000662;
WTHA=transpose(W.data(249,3:qw))/PTHA;
THA=zeros(DD,1);
for j=1:DD
    THA(j,1)=max(0,WTHA(j+526,1)-WTHA(j+519,1))/7;
end

% United Staes 251 236
PUSA=333.225477;
WUSA=transpose(W.data(255,3:qw))/PUSA;
USA=zeros(DD,1);
for j=1:DD
    USA(j,1)=max(0,WUSA(j+526,1)-WUSA(j+519,1))/7;
end

% United Kingdom 266 251
PGBR=68.294438;
WGBR=transpose(W.data(270,3:qw))/PGBR;
GBR=zeros(DD,1);
for j=1:DD
    GBR(j,1)=max(0,WGBR(j+526,1)-WGBR(j+519,1))/7;
end

% Vietnam
PVNM=98.341025;
WVNM=transpose(W.data(275,3:qw))/PVNM;
VNM=zeros(DD,1);
for j=1:DD
    VNM(j,1)=max(0,WVNM(j+526,1)-WVNM(j+519,1))/7;
end
    
websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
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
subplot(1,2,1)
plot([JPN,TKY,OKNW,MYS,THA,BWN,LKA,USA,GBR],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by JHU and NHK')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('Japan','Tokyo','Okinawa','Malaysia','Thailand','Brunei','Sri Lanka','United States','United Kingdom','Location','northwest');
%
subplot(1,2,2)
plot([JPN,PHI,SIN,KOR,VNM,IDN,NSW],'LineWidth',2)
title('COVID-19 in the World (daily new cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(DD/2) DD])
xticklabels({[ll0],[ll1],[ll2]})
legend('Japan','Philippines','Singapore','South Korea','Vietnam','Indonesia','New South Wales','Location','northwest');

