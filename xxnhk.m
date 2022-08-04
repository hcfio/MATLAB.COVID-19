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
l1=string('2022-03-01');
l2=string('2022-05-01');
l3=string('2022-07-01');
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

% Kyushu code 40 41 42 43 44 45 46
PFUK=5.112176;
PSAG=0.805721;
PNAG=1.290992;
PKUM=1.722474;
POIT=1.110553;
PMIY=1.057609;
PKAG=1.571833;
PKYU=PFUK+PSAG+PNAG+PKUM+POIT+PMIY+PKAG;
ROWFUK=find(B(:)==40);
ROWSAG=find(B(:)==41);
ROWNAG=find(B(:)==42);
ROWKUM=find(B(:)==43);
ROWOIT=find(B(:)==44);
ROWMIY=find(B(:)==45);
ROWKAG=find(B(:)==46);
FUK1=A.data(ROWFUK,2);
SAG1=A.data(ROWSAG,2);
NAG1=A.data(ROWNAG,2);
KUM1=A.data(ROWKUM,2);
OIT1=A.data(ROWOIT,2);
MIY1=A.data(ROWMIY,2);
KAG1=A.data(ROWKAG,2);
KYU1=(FUK1+SAG1+NAG1+KUM1+OIT1+MIY1+KAG1)/PKYU;
KYU3=zeros(D,1);
for j=1:D
    KYU3(j,1)=(KYU1(j+716,1)-KYU1(j+709,1))/7;
end

% Hokkaido code 1
PHKD=5.191355;
ROWHKD=find(B(:)==1);
HKD1=A.data(ROWHKD,2)/PHKD;
HKD3=zeros(D,1);
for j=1:D
    HKD3(j,1)=(HKD1(j+716,1)-HKD1(j+709,1))/7;
end


newcolors = [0 0 1; 
             1 131/255 0; 
             0 1 0; 
             1 0 0; 
             0 191/255 1;
             138/255 43/255 226/255; 
             1 0 1; 
             220/255 220/255 220/255; 
             1 191/255 17/255;
             169/255 80/255 69/255];
colororder(newcolors)         
% c=hsv(6);
% colororder(c);


v = VideoWriter('covid19.mp4','MPEG-4');
v.FrameRate=10;
open(v);
% plot
for k=1:D
    JPN=JPN3(1:k,1);
    TKY=TKY3(1:k,1);
    OKNW=OKNW3(1:k,1);
    OSK=OSK3(1:k,1);
    HKD=HKD3(1:k,1);
    KYU=KYU3(1:k,1);
    plot([JPN,TKY,OKNW,OSK,KYU],'LineWidth',2)
    xlim([0 D+1]);
    ylim([0 3500])
    title('COVID-19: 7-day average of daily new cases per 1M','data sourced by NHK (Japanese Public TV)')
    xlabel('date');
    ylabel('cases/1M');
    xticks([1 60 122 D]) %l2 121
    xticklabels({[l0],[l1],[l2],[ll]})
    legend('Japan','Tokyo','Okinawa','Osaka','Kyushu','Location','northwest');
    drawnow
    pause(0.02)
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);