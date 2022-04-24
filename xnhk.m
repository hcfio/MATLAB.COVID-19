websave('./csv/nhk_prefectures.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('./csv/nhk_prefectures.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

websave('./csv/nhk_japan.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_domestic_daily_data.csv');
JP=importdata('./csv/nhk_japan.csv');

dd0=strrep(A.textdata(718,1),'/','-');
d0=datetime(dd0);
dd1=strrep(A.textdata(l+1,1),'/','-');
d1=datetime(dd1);
D=1+days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=string('2022-02-01');
l2=string('2022-03-01');
l3=string('2022-04-01');
ll=datestr(d1,'yyyy-mm-dd');

% Japan (125M)
PJPN=125.845010;
JPN1=JP.data(:,2)/PJPN;
JPN3=zeros(D,1);
for j=1:D
    JPN3(j,1)=(JPN1(j+716,1)-JPN1(j+709,1))/7;
end

% Tokyo: code 13, 
PTKY=13.988129;
ROWTKY=find(B(:)==13);
TKY1=A.data(ROWTKY,2)/PTKY;
TKY3=zeros(D,1);
for j=1:D
    TKY3(j,1)=(TKY1(j+716,1)-TKY1(j+709,1))/7;
end

% Okinawa: code 47
POKNW=1.469335;    
ROWOKNW=find(B(:)==47);
OKNW1=A.data(ROWOKNW,2)/POKNW;
OKNW3=zeros(D,1);
for j=1:D
    OKNW3(j,1)=(OKNW1(j+716,1)-OKNW1(j+709,1))/7;
end

% Osaka: code 27
POSK=8.797153;
ROWOSK=find(B(:)==27);
OSK1=A.data(ROWOSK,2)/POSK;
OSK3=zeros(D,1);
for j=1:D
    OSK3(j,1)=(OSK1(j+716,1)-OSK1(j+709,1))/7;
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
% c=hsv(6);
% colororder(c);

% plot
plot([JPN3,TKY3,OKNW3,OSK3],'LineWidth',2)
title('COVID-19: 7-day average of daily new cases per 1M','data sourced by NHK (Japanese Public TV)')
xlabel('date');
ylabel('cases/1M');
xticks([1 32 60 91 D])
xticklabels({[l0],[l1],[l2],[l3],[ll]})
legend('Japan','Tokyo','Okinawa','Osaka','Location','northwest');
set(gcf,'Position',[600,200,600,400]);
saveas(gcf,'xnhk.png');
