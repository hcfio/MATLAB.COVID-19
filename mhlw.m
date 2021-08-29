websave("mhlw_new_cases.csv","https://covid19.mhlw.go.jp/public/opendata/newly_confirmed_cases_daily.csv");
websave("mhlw_cases.csv","https://covid19.mhlw.go.jp/public/opendata/confirmed_cases_cumulative_daily.csv");
websave("mhlw_deaths.csv","https://covid19.mhlw.go.jp/public/opendata/deaths_cumulative_daily.csv");
websave("mhlw_recovered.csv","https://covid19.mhlw.go.jp/public/opendata/requiring_inpatient_care_etc_daily.csv");
XN=importdata("mhlw_new_cases.csv");
XC=importdata("mhlw_cases.csv");
XD=importdata("mhlw_deaths.csv");
XR=importdata("mhlw_recovered.csv");
l=length(XC.data(:,1));
m=length(XN.data(:,1));
n=floor(l/48);
k=floor(m/48);
VN=XN.data(:,1);
VC=XC.data(:,1);
VD=XD.data(:,1);
VR=XR.data(:,2);

MN=zeros(48,k);
for j=1:k
    for i=1:48
    MN(i,j)=VN(i+48*(j-1));
    end
end

MC=zeros(48,n);
for j=1:n
    for i=1:48
    MC(i,j)=VC(i+48*(j-1));
    end
end

MD=zeros(48,n);
for j=1:n
    for i=1:48
    MD(i,j)=VD(i+48*(j-1));
    end
end

MR=zeros(48,n);
for j=1:n
    for i=1:48
    MR(i,j)=VR(i+48*(j-1));
    end
end

d0=datetime('2020-05-09');
xd1=strrep(XC.textdata(l+1,1),'/','-');
d1=datetime(xd1);
D=1+days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor((D-1)/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*(D-1)/3)),'yyyy-mm-dd');
lf=datestr(d1,'yyyy-mm-dd');

dd0=datetime('2021-07-01');
DD=1+days(d1-dd0);
ll0=datestr(dd0,'yyyy-mm-dd');
ll1=datestr(dd0+days(floor((DD-1)/2)),'yyyy-mm-dd');
ll2=datestr(d1,'yyyy-mm-dd');

% Japan
PJPN=125.36;
XJPN=MN(1,:)/PJPN;
CJPN=MC(1,:)/PJPN;
DJPN=MD(1,:)/PJPN;
RJPN=MR(1,:)/PJPN;
AJPN=CJPN-RJPN-DJPN;
NJPN=zeros(1,D);
for j=1:7
    NJPN(1,j)=(XJPN(1,j+104)+XJPN(1,j+103)+XJPN(1,j+102)+XJPN(1,j+101)+XJPN(1,j+100)+XJPN(1,j+99)+XJPN(1,j+98))/7;
end
for j=8:D
    NJPN(1,j)=(CJPN(1,j)-CJPN(1,j-7))/7;
end
NDJPN=zeros(1,D);
for j=1:7
    NDJPN(1,j)=(DJPN(1,j)-DJPN(1,1))/j;
end
for j=8:D
    NDJPN(1,j)=(DJPN(1,j)-DJPN(1,j-7))/7;
end

% Tokyo
PTKY=14.049146;
XTKY=MN(14,:)/PTKY;
CTKY=MC(14,:)/PTKY;
DTKY=MD(14,:)/PTKY;
RTKY=MR(14,:)/PTKY;
ATKY=CTKY-RTKY-DTKY;
NTKY=zeros(1,D);
for j=1:7
    NTKY(1,j)=(XTKY(1,j+104)+XTKY(1,j+103)+XTKY(1,j+102)+XTKY(1,j+101)+XTKY(1,j+100)+XTKY(1,j+99)+XTKY(1,j+98))/7;
end
for j=8:D
    NTKY(1,j)=(CTKY(1,j)-CTKY(1,j-7))/7;
end
NDTKY=zeros(1,D);
for j=1:7
    NDTKY(1,j)=(DTKY(1,j)-DTKY(1,1))/j;
end
for j=8:D
    NDTKY(1,j)=(DTKY(1,j)-DTKY(1,j-7))/7;
end

% Okinawa
POKNW=1.458870;
XOKNW=MN(48,:)/POKNW;
COKNW=MC(48,:)/POKNW;
DOKNW=MD(48,:)/POKNW;
ROKNW=MR(48,:)/POKNW;
AOKNW=COKNW-ROKNW-DOKNW;
NOKNW=zeros(1,D);
for j=1:7
    NOKNW(1,j)=(XOKNW(1,j+104)+XOKNW(1,j+103)+XOKNW(1,j+102)+XOKNW(1,j+101)+XOKNW(1,j+100)+XOKNW(1,j+99)+XOKNW(1,j+98))/7;
end
for j=8:D
    NOKNW(1,j)=(COKNW(1,j)-COKNW(1,j-7))/7;
end
NDOKNW=zeros(1,D);
for j=1:7
    NDOKNW(1,j)=(DOKNW(1,j)-DOKNW(1,1))/j;
end
for j=8:D
    NDOKNW(1,j)=(DOKNW(1,j)-DOKNW(1,j-7))/7;
end

% Osaka
POSK=8.798545;
XOSK=MN(28,:)/POSK;
COSK=MC(28,:)/POSK;
DOSK=MD(28,:)/POSK;
ROSK=MR(28,:)/POSK;
AOSK=COSK-ROSK-DOSK;
NOSK=zeros(1,D);
for j=1:7
    NOSK(1,j)=(XOSK(1,j+104)+XOSK(1,j+103)+XOSK(1,j+102)+XOSK(1,j+101)+XOSK(1,j+100)+XOSK(1,j+99)+XOSK(1,j+98))/7;
end
for j=8:D
    NOSK(1,j)=(COSK(1,j)-COSK(1,j-7))/7;
end
NDOSK=zeros(1,D);
for j=1:7
    NDOSK(1,j)=(DOSK(1,j)-DOSK(1,1))/j;
end
for j=8:D
    NDOSK(1,j)=(DOSK(1,j)-DOSK(1,j-7))/7;
end

% Hyogo
PHYG=5.446455;
XHYG=MN(29,:)/PHYG;
CHYG=MC(29,:)/PHYG;
DHYG=MD(29,:)/PHYG;
RHYG=MR(29,:)/PHYG;
AHYG=CHYG-RHYG-DHYG;
NHYG=zeros(1,D);
for j=1:7
    NHYG(1,j)=(XHYG(1,j+104)+XHYG(1,j+103)+XHYG(1,j+102)+XHYG(1,j+101)+XHYG(1,j+100)+XHYG(1,j+99)+XHYG(1,j+98))/7;
end
for j=8:D
    NDHYG(1,j)=(DHYG(1,j)-DHYG(1,1))/j;
end
NDHYG=zeros(1,D);
for j=1:7
    NDHYG(1,j)=DHYG(1,j)/j;
end
for j=8:D
    NDHYG(1,j)=(DHYG(1,j)-DHYG(1,j-7))/7;
end

% Hokkaido
PHKD=5.207185;
XHKD=MN(2,:)/PHKD;
CHKD=MC(2,:)/PHKD;
DHKD=MD(2,:)/PHKD;
RHKD=MR(2,:)/PHKD;
AHKD=CHKD-RHKD-DHKD;
NHKD=zeros(1,D);
for j=1:7
    NHKD(1,j)=(XHKD(1,j+104)+XHKD(1,j+103)+XHKD(1,j+102)+XHKD(1,j+101)+XHKD(1,j+100)+XHKD(1,j+99)+XHKD(1,j+98))/7;
end
for j=8:D
    NHKD(1,j)=(CHKD(1,j)-CHKD(1,j-7))/7;
end
NDHKD=zeros(1,D);
for j=1:7
    NDHYG(1,j)=(DHYG(1,j)-DHYG(1,1))/j;
end
for j=8:D
    NDHKD(1,j)=(DHKD(1,j)-DHKD(1,j-7))/7;
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
%c=hsv(6);
%colororder(c);

subplot(2,2,1)
plot([CJPN',CTKY',COKNW'],'LineWidth',2)
title('COVID-19: cases per 1M','data sourced by MOH of Japan')
xlabel('date')
ylabel('cases/1M')
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Location','northwest');
% plot
subplot(2,2,2)
plot([DJPN',DTKY',DOKNW',DOSK',DHYG',DHKD'],'LineWidth',2)
title('COVID-19: deaths per 1M','data sourced by MOH of Japan')
xlabel('date')
ylabel('deaths/1M')
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Hyogo','Hokkaido','Location','northwest');
% plot
subplot(2,2,3)
plot([NJPN',NTKY',NOKNW'],'LineWidth',2)
title('COVID-19: 7-day average of new cases per 1M','data sourced by MOH of Japan')
xlabel('date')
ylabel('cases/1M')
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Location','northwest');
%
subplot(2,2,4)
plot([NDJPN',NDTKY',NDOKNW',NDOSK',NDHYG',NDHKD'],'LineWidth',2)
title('COVID-19: 7-day average deaths per 1M','data sourced by MOH of Japan')
xlabel('date')
ylabel('deaths/1M')
xticks([1 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Japan','Tokyo','Okinawa','Osaka','Hyogo','Hokkaido','Location','northwest');
