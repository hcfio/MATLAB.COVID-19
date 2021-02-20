websave('nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

websave('nhk_news_covid19_domestic_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_domestic_daily_data.csv');
JP=importdata('nhk_news_covid19_domestic_daily_data.csv');
JPN1=JP.data(:,2)/126;
JPN2=JP.data(:,4)/126;
% JPN3=JP.data(:,1)/126;

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
OKNW1=A.data(rowoknw,2)/1.46;
OKNW2=A.data(rowoknw,4)/1.46;
% OKNW3=A.data(rowoknw,1)/1.46;
% Hokkaido (5.27M): code 1, 
rowhkd=find(B(:)==1);
HKD1=A.data(rowhkd,2)/5.27;
HKD2=A.data(rowhkd,4)/5.27;
% HKD3=A.data(rowhkd,1)/5.27;
% Tokyo (14M): code 13, 
rowtky=find(B(:)==13);
TKY1=A.data(rowtky,2)/14;
TKY2=A.data(rowtky,4)/14;
% TKY3=A.data(rowtky,1)/14;
% Osaka (8.81M): code 27
rowosk=find(B(:)==27);
OSK1=A.data(rowosk,2)/8.81;
OSK2=A.data(rowosk,4)/8.81;
% OSK3=A.data(rowosk,1)/8.81;
% Hyogo (5.43M): code 28
rowhyg=find(B(:)==28);
HYG1=A.data(rowhyg,2)/5.43;
HYG2=A.data(rowhyg,4)/5.43;
% HYG3=A.data(rowhyg,1)/5.43;
% Saitama (7.34M): code 11, 
rowstm=find(B(:)==11);
STM1=A.data(rowstm,2)/7.34;
STM2=A.data(rowstm,4)/7.34;
% STM3=A.data(rowstm,1)/7.34;
% kanagawa (9.22M): code 14
rowkng=find(B(:)==14);
KNG1=A.data(rowkng,2)/9.22;
KNG2=A.data(rowkng,4)/9.22;
% KNG3=A.data(rowkng,1)/9.22;

newcolors = [0 0 0; 
             0 1 0; 
             0 0 1; 
             0 1 1; 
             1 0 1; 
             1 0 0;
             0.85 0.325 0.098; 
             1 0.54 0; 
             0.47 0.25 0.8; 
             0.25 0.8 0.54];
colororder(newcolors)         
% plot
subplot(1,2,1)
plot([JPN1,TKY1,OSK1,HKD1,OKNW1,KNG1,STM1],'LineWidth',2)
title('COVID-19 in Japan (total cases per 1M)','data sourced by NHK')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Osaka','Hokkaido','Okinawa','Kanagawa','Saitama','Location','northwest');
% plot
subplot(1,2,2)
plot([JPN2,TKY2,OSK2,HKD2,OKNW2,KNG2,STM2],'LineWidth',2)
title('COVID-19 in Japan (death toll per 1M)','data sourced by NHK')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Osaka','Hokkaido','Okinawa','Kanagawa','Saitama','Location','northwest');
