websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
W=importdata('time_series_covid19_confirmed_global.csv');
[pw qw]=size(W.data);

d0=datetime(2020,1,22);
d1=d0+days(qw-3);
D=days(d1-d0);
ddd0=datetime('2021-07-01');
L0=string('2021-07-01');
L1=datestr(ddd0+days(floor((D-526)/2)),'yyyy-mm-dd');
L2=datestr(d1,'yyyy-mm-dd');

% Indonesia
PIDN=271;
WIDN=transpose(W.data(149,3:qw))/PIDN;
IDN=zeros(qw-528,1);
for j=1:qw-528
    IDN(j,1)=WIDN(j+526,1)-WIDN(j+525,1);
end

% Japan
PJPN=125.36;
WJPN=transpose(W.data(156,3:qw))/PJPN;
JPN=zeros(qw-528,1);
for j=1:qw-528
    JPN(j,1)=WJPN(j+526,1)-WJPN(j+525,1);
end

% Malaysia
PMYS=32;
WMYS=transpose(W.data(177,3:qw))/PMYS;
MYS=zeros(qw-528,1);
for j=1:qw-528
    MYS(j,1)=WMYS(j+526,1)-WMYS(j+525,1);
end

% Thailand
PTHA=70;
WTHA=transpose(W.data(249,3:qw))/PTHA;
THA=zeros(qw-528,1);
for j=1:qw-528
    THA(j,1)=WTHA(j+526,1)-WTHA(j+525,1);
end

% United Staes 251 236
PUSA=331;
WUSA=transpose(W.data(255,3:qw))/PUSA;
USA=zeros(qw-528,1);
for j=1:qw-528
    USA(j,1)=WUSA(j+526,1)-WUSA(j+525,1);
end

% United Kingdom 266 251
PGBR=67.9;
WGBR=transpose(W.data(270,3:qw))/PGBR;
GBR=zeros(qw-528,1);
for j=1:qw-528
    GBR(j,1)=max(0,WGBR(j+526,1)-WGBR(j+525,1));
end

% NSW
PNSW=8.2;
WNSW=transpose(W.data(10,3:qw))/PNSW;
NSW=zeros(qw-528,1);
for j=1:qw-528
    NSW(j,1)=max(0,WNSW(j+526,1)-WNSW(j+525,1));
end

% South Korea
PKOR=51.318552
WKOR=transpose(W.data(161,3:qw))/PKOR;
KOR=zeros(qw-528,1);
for j=1:qw-528
    KOR(j,1)=max(0,WKOR(j+526,1)-WKOR(j+525,1));
end

% Singapore
PSIN=5.902011;
WSIN=transpose(W.data(231,3:qw))/PSIN;
SIN=zeros(qw-528,1);
for j=1:qw-528
    SIN(j,1)=max(0,WSIN(j+526,1)-WSIN(j+525,1));
end

% Vietnam
PVNM=98.32;
WVNM=transpose(W.data(275,3:qw))/PVNM;
VNM=zeros(qw-528,1);
for j=1:qw-528
    VNM(j,1)=max(0,WVNM(j+526,1)-WVNM(j+525,1));
end
    
websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

% Okinawa (1.46M): code 47
rowoknw=find(B(:)==47);
OKNW3=A.data(rowoknw,1)/1.458870;
OKNW=zeros(qw-528,1);
for j=1:qw-528
    OKNW(j,1)=OKNW3(j+532,1);
end

% Tokyo (14M): code 13, 
rowtky=find(B(:)==13);
TKY3=A.data(rowtky,1)/14.049146;
TKY=zeros(qw-528,1);
for j=1:qw-528
    TKY(j,1)=TKY3(j+532,1);
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
plot([JPN,TKY,OKNW,MYS,THA,USA,GBR],'LineWidth',2)
title('COVID-19 in the World (daily new cases per 1M)','data sourced by JHU and NHK')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor((D-526)/2) D-526])
xticklabels({[L0],[L1],[L2]})
legend('Japan','Tokyo','Okinawa','Malaysia','Thailand','United States','United Kingdom','Location','northwest');
%
subplot(1,2,2)
plot([JPN,NSW,SIN,KOR,VNM,IDN],'LineWidth',2)
title('COVID-19 in the World (daily new cases per 1M)','data sourced by JHU')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor((D-526)/2) D-526])
xticklabels({[L0],[L1],[L2]})
legend('Japan','New South Wales','Singapore','South Korea','Vietnam','Indonesia','Location','northwest');

