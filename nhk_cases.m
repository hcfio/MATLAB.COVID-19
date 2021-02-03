websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

websave('nhk_news_covid19_domestic_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_domestic_daily_data.csv');
JP=importdata('nhk_news_covid19_domestic_daily_data.csv');
JPN=JP.data(:,2)/126;

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
OKNW=A.data(rowoknw,2)/1.46;
% Hokkaido (5.27M): code 1, 
rowhkd=find(B(:)==1);
HKD=A.data(rowhkd,2)/5.27;
% Tokyo (14M): code 13, 
rowtky=find(B(:)==13);
TKY=A.data(rowtky,2)/14;
% Osaka (8.81M): code 27
rowosk=find(B(:)==27);
OSK=A.data(rowosk,2)/8.81;

% plot
plot([OKNW,TKY,OSK,HKD,JPN],'LineWidth',2)
title('COVID-19 in Japan (total cases per 1M)','data sourced by NHK')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Okinawa','Tokyo','Osaka','Hokkaido','Japan','Location','northwest');
