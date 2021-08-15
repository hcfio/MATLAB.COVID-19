websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
W=importdata('time_series_covid19_confirmed_global.csv');
[pw qw]=size(W.data);

d0=datetime(2020,1,22);
d1=d0+days(qw-3);
D=days(d1-d0);
ddd0=datetime('2021-04-01');
L0=string('2021-04-01');
L1=datestr(ddd0+days(floor((D-435)/2)),'yyyy-mm-dd');
L2=datestr(d1,'yyyy-mm-dd');

% Indonesia
PIDN=271;
WIDN=transpose(W.data(149,3:qw))/PIDN;
IDN=zeros(qw-437,1);
for j=1:qw-437
    IDN(j,1)=WIDN(j+435,1)-WIDN(j+434,1);
end

% Japan
PJPN=125.36;
WJPN=transpose(W.data(156,3:qw))/PJPN;
JPN=zeros(qw-437,1);
for j=1:qw-437
    JPN(j,1)=WJPN(j+435,1)-WJPN(j+434,1);
end

% Malaysia
PMYS=32;
WMYS=transpose(W.data(177,3:qw))/PMYS;
MYS=zeros(qw-437,1);
for j=1:qw-437
    MYS(j,1)=WMYS(j+435,1)-WMYS(j+434,1);
end

% Thailand
PTHA=70;
WTHA=transpose(W.data(249,3:qw))/PTHA;
THA=zeros(qw-437,1);
for j=1:qw-437
    THA(j,1)=WTHA(j+435,1)-WTHA(j+434,1);
end

% United Staes 251 236
PUSA=331;
WUSA=transpose(W.data(255,3:qw))/PUSA;
USA=zeros(qw-437,1);
for j=1:qw-437
    USA(j,1)=WUSA(j+435,1)-WUSA(j+434,1);
end

% United Kingdom 266 251
PGBR=67.9;
WGBR=transpose(W.data(270,3:qw))/PGBR;
GBR=zeros(qw-437,1);
for j=1:qw-437
    GBR(j,1)=max(0,WGBR(j+435,1)-WGBR(j+434,1));
end

websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

% Okinawa (1.46M): code 47
rowoknw=find(B(:)==47);
OKNW3=A.data(rowoknw,1)/1.458870;
OKNW=zeros(qw-437,1);
for j=1:qw-437
    OKNW(j,1)=OKNW3(j+441,1);
end

% Tokyo (14M): code 13, 
rowtky=find(B(:)==13);
TKY3=A.data(rowtky,1)/14.049146;
TKY=zeros(qw-437,1);
for j=1:qw-437
    TKY(j,1)=TKY3(j+441,1);
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
plot([JPN,TKY,OKNW,IDN,MYS,THA,USA,GBR],'LineWidth',1)
title('COVID-19 in the World (daily new cases per 1M)','data sourced by JHU and NHK')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor((D-435)/2) D-435])
xticklabels({[L0],[L1],[L2]})
legend('Japan','Tokyo','Okinawa','Indonesia','Malaysia','Thailand','United States','United Kingdom','Location','northwest');
