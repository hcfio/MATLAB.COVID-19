websave('./csv/nhk_news_covid19_prefectures_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_prefectures_daily_data.csv');
A=importdata('./csv/nhk_news_covid19_prefectures_daily_data.csv');
l=length(A.data(:,2));
B=str2double(A.textdata(2:l+1,2));

websave('./csv/nhk_news_covid19_domestic_daily_data.csv','https://www3.nhk.or.jp/n-data/opendata/coronavirus/nhk_news_covid19_domestic_daily_data.csv');
JP=importdata('./csv/nhk_news_covid19_domestic_daily_data.csv');

dd0=strrep(A.textdata(2,1),'/','-');
d0=datetime(dd0);
dd1=strrep(A.textdata(l+1,1),'/','-');
d1=datetime(dd1);
D=1+days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor((D-1)/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*(D-1)/3)),'yyyy-mm-dd');
lf=datestr(d1,'yyyy-mm-dd');

ddd0=datetime('2021-07-01');
DD=1+days(d1-ddd0);
ll0=string('2021-07-01');
ll1=datestr(ddd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(d1,'yyyy-mm-dd');

% Japan (125M)
PJPN=125.36;
JPN1=JP.data(:,2)/PJPN;
JPN2=JP.data(:,4)/PJPN;
JPN3=zeros(D,1);
for j=1:7
    JPN3(j,1)=JPN1(j,1)/j;
end
for j=8:D
    JPN3(j,1)=(JPN1(j,1)-JPN1(j-7,1))/7;
end
JPN4=zeros(D,1);
for j=1:7
    JPN4(j,1)=JPN4(j,1)/j;
end
for j=8:D
    JPN4(j,1)=(JPN2(j,1)-JPN2(j-7,1))/7;
end

% Tokyo: code 13, 
PTKY=14.049146;
ROWTKY=find(B(:)==13);
TKY1=A.data(ROWTKY,2)/PTKY;
TKY2=A.data(ROWTKY,4)/PTKY;
TKY3=zeros(D,1);
for j=1:7
    TKY3(j,1)=TKY1(j,1)/j;
end
for j=8:D
    TKY3(j,1)=(TKY1(j,1)-TKY1(j-7,1))/7;
end
TKY4=zeros(DD,1);
for j=1:7
    TKY4(j,1)=TKY2(j,1)/j;
end
for j=8:D
    TKY4(j,1)=(TKY2(j,1)-TKY2(j-7,1))/7;
end

% Okinawa: code 47
POKNW=1.458870;
ROWOKNW=find(B(:)==47);
OKNW1=A.data(ROWOKNW,2)/POKNW;
OKNW2=A.data(ROWOKNW,4)/POKNW;
OKNW3=zeros(DD,1);
for j=1:7
    OKNW3(j,1)=OKNW1(j,1)/j;
end
for j=8:D
    OKNW3(j,1)=(OKNW1(j,1)-OKNW1(j-7,1))/7;
end
OKNW4=zeros(DD,1);
for j=1:7
    OKNW4(j,1)=OKNW2(j,1)/j;
end
for j=8:D
    OKNW4(j,1)=(OKNW2(j,1)-OKNW2(j-7,1))/7;
end

% Osaka: code 27
POSK=8.798545;
ROWOSK=find(B(:)==27);
OSK1=A.data(ROWOSK,2)/POSK;
OSK2=A.data(ROWOSK,4)/POSK;
OSK3=zeros(D,1);
for j=1:7
    OSK3(j,1)=OSK1(j,1)/j;
end
for j=8:D
    OSK3(j,1)=(OSK1(j,1)-OSK1(j-7,1))/7;
end
OSK4=zeros(DD,1);
for j=1:7
    OSK4(j,1)=OSK2(j,1)/j;
end
for j=8:D
    OSK4(j,1)=(OSK2(j,1)-OSK2(j-7,1))/7;
end

% Hyogo: code 28
PHYG=5.446455;
rowhyg=find(B(:)==28);
HYG1=A.data(rowhyg,2)/PHYG;
HYG2=A.data(rowhyg,4)/PHYG;
HYG3=zeros(D,1);
for j=1:7
    HYG3(j,1)=HYG1(j,1)/j;
end
for j=8:D
    HYG3(j,1)=(HYG1(j,1)-HYG1(j-7,1))/7;
end
HYG4=zeros(DD,1);
for j=1:7
    HYG4(j,1)=HYG2(j,1)/j;
end
for j=8:D
    HYG4(j,1)=(HYG2(j,1)-HYG2(j-7,1))/7;
end

% Hokkaido: code 1,
PHKD=5.207185;
rowhkd=find(B(:)==1);
HKD1=A.data(rowhkd,2)/PHKD;
HKD2=A.data(rowhkd,4)/PHKD;
HKD4=zeros(DD,1);
HKD3=zeros(D,1);
for j=1:7
    HKD3(j,1)=HKD1(j,1)/j;
end
for j=8:D
    HKD3(j,1)=(HKD1(j,1)-HKD1(j-7,1))/7;
end
HKD4=zeros(DD,1);
for j=1:7
    HKD4(j,1)=HKD2(j,1)/j;
end
for j=8:D
    HKD4(j,1)=(HKD2(j,1)-HKD2(j-7,1))/7;
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
subplot(2,2,1)
plot([JPN1,TKY1,OKNW1],'LineWidth',2)
title('COVID-19 in Japan (total cases per 1M)','data sourced by NHK (Japanese Public TV)')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Location','northwest');
% plot
subplot(2,2,2)
plot([JPN2,TKY2,OKNW2,OSK2,HYG2,HKD2],'LineWidth',2)
title('COVID-19 in Japan (death toll per 1M)','data sourced by NHK (Japanese Public TV)')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Hyogo','Hokkaido','Location','northwest');
% plot
subplot(2,2,3)
plot([JPN3,TKY3,OKNW3],'LineWidth',2)
title('COVID-19 in Japan (daily new cases per 1M)','data sourced by NHK (Japanese Public TV)')
xlabel('date');
ylabel('cases/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Location','northwest');
% plot
subplot(2,2,4)
plot([JPN4,TKY4,OKNW4,OSK4,HYG4,HKD4],'LineWidth',2)
title('COVID-19 in Japan (7-day average deaths per 1M)','data sourced by NHK (Japanese Public TV)')
xlabel('date');
ylabel('deaths/1M');
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Hyogo','Hokkaido','Location','northwest');
set(gcf,'Position',[600,200,1200,800]);
saveas(gcf,'nhk.png');
