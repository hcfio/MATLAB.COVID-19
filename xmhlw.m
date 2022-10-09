websave("./csv/mhlw_cases.csv","https://covid19.mhlw.go.jp/public/opendata/confirmed_cases_cumulative_daily.csv");
websave("./csv/mhlw_deaths.csv","https://covid19.mhlw.go.jp/public/opendata/deaths_cumulative_daily.csv");
XC=importdata("./csv/mhlw_cases.csv");
XD=importdata("./csv/mhlw_deaths.csv");
l=length(XC.data(:,1));
VC=XC.data(:,:);
VD=XD.data(:,:);

d0=datetime('2022-07-01');
d1=datetime('2022-08-01');
d2=datetime('2022-09-01');
xdf=strrep(XC.textdata(l+1,1),'/','-');
df=datetime(xdf);
D=1+days(df-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d1,'yyyy-mm-dd');
l2=datestr(d2,'yyyy-mm-dd');
lf=datestr(df,'yyyy-mm-dd');

dd0=datetime('2021-07-01');
DD=1+days(d1-dd0);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(d1,'yyyy-mm-dd');

% Japan
PJPN=125.845010;
CJPN=VC(:,1)/PJPN;
DJPN=VD(:,1)/PJPN;
NJPN=zeros(D,1);
for j=1:D
    NJPN(j,1)=(CJPN(j+783,1)-CJPN(j+776,1))/7;
end
NDJPN=zeros(D,1);
for j=1:D
    NDJPN(j,1)=(DJPN(j+783,1)-DJPN(j+776,1))/7;
end

% Tokyo
PTKY=13.988129;
CTKY=VC(:,14)/PTKY;
DTKY=VD(:,14)/PTKY;
NTKY=zeros(D,1);
for j=1:D
    NTKY(j,1)=(CTKY(j+783,1)-CTKY(j+776,1))/7;
end
NDTKY=zeros(D,1);
for j=1:D
    NDTKY(j,1)=(DTKY(j+783,1)-DTKY(j+776,1))/7;
end

% Okinawa
POKNW=1.469335;    
COKNW=VC(:,48)/POKNW;
DOKNW=VD(:,48)/POKNW;
NOKNW=zeros(D,1);
for j=1:D
    NOKNW(j,1)=(COKNW(j+783,1)-COKNW(j+776,1))/7;
end
NDOKNW=zeros(D,1);
for j=1:D
    NDOKNW(j,1)=(DOKNW(j+783,1)-DOKNW(j+776,1))/7;
end

% Osaka
POSK=8.797153;
COSK=VC(:,28)/POSK;
DOSK=VD(:,28)/POSK;
NOSK=zeros(D,1);
for j=1:D
    NOSK(j,1)=(COSK(j+783,1)-COSK(j+776,1))/7;
end
NDOSK=zeros(D,1);
for j=1:D
    NDOSK(j,1)=(DOSK(j+783,1)-DOSK(j+776,1))/7;
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
subplot(1,2,1)
plot([NJPN NTKY NOKNW NOSK],'LineWidth',1.5)
title('COVID-19: 7-day average of new cases per 1M','data sourced by MoH of Japan')
xlabel('date')
ylabel('cases/1M')
xticks([1 32 63 D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Location','northeast');
%
subplot(1,2,2)
plot([NDJPN NDTKY NDOKNW NDOSK],'LineWidth',1.5)
title('COVID-19: 7-day average of daily deaths per 1M','data sourced by MoH of Japan')
xlabel('date')
ylabel('deaths/1M')
xticks([1 32 63 D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Location','northwest');
%
set(gcf,'Position',[600,200,1200,450]);
saveas(gcf,'xmhlw.png');