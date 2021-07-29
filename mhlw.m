% mhlw.m
%%%%%%%%%%%%%%%%%%
% Download data from the MHLW web site.
websave('pcr_positive_daily.csv','https://www.mhlw.go.jp/content/pcr_positive_daily.csv');
websave('recovery_total.csv','https://www.mhlw.go.jp/content/recovery_total.csv');
Acsv=importdata('pcr_positive_daily.csv');
Bcsv=importdata('recovery_total.csv');

% Shape up the data.
% N: the number of days between d0 and the date of update. 
% A(n,1): total cases on the n-th day
% B(n,1): the number of total discharged cases on the n-th day
% C(n,1)=A(n,1)-B(n,1) the active cases and the deaths     
AAA=Acsv.data;
BB=Bcsv.data;
aa=length(AAA);
bb=length(BB);
AA=zeros(aa,1);
for n=2:aa
    AA(n,1)=AAA(n,1)+AA(n-1,1);
end
N=aa-16;
A=zeros(N,1);
B=zeros(N,1);
n=transpose(1:N);
A17=zeros(17,1);
A17(1,1)=AAA(1,1);
for l=2:17
    A17(l,1)=AAA(l,1)+A17(l-1,1);
end
A(1,1)=A17(17,1);
for k=2:N
    A(k,1)=AAA(16+k,1)+A(k-1,1);
end
B(n,1)=BB(3+n,1);
C=A-B;

% setting data 
% d0: the initial day
% df: the date of update
d0=datetime(2020,2,1);
ddff=strrep(Acsv.textdata(aa+1,1),'/','-');
df=datetime(ddff);


% setting sir
T0=AA(aa,1);
R0=BB(bb,1);
% d2: 7 days before d0
% T2: total cases
% R2: discharged 
D2=datetime(df-days(7));
T2=AA(aa-7,1);
R2=BB(bb-7,1);
% total population
POP=125360000;
% simulation period [days]
D=4*7;
% Set the constants beta and gamma of the SIR model. 
T1=(T0-T2)/days(df-D2);
R1=(R0-R2)/days(df-D2);
beta=T1/(T0-R0)/(POP-T0);
gamma=R1/(T0-R0);
% Solve the initial value ptoblem.
[t,u]=ode45(@(t,u) [-beta*u(1)*u(2); beta*u(1)*u(2)-gamma*u(2); gamma*u(2)], [0,D], [POP-T0;T0-R0;R0]);

% plot data
l0=datestr(d0,'dd-mmm-yyyy');
l1=datestr(d0+days(floor(N/3)),'dd-mmm-yyyy');
l2=datestr(d0+days(floor(2*N/3)),'dd-mmm-yyyy');
lf=datestr(df,'dd-mmm-yyyy');
subplot(1,2,1)
plot(n,A,n,C,n,B,'LineWidth',2)
title('COVID-19 in Japan (125M)','data sourced by Japanese Ministry of Health')
xlabel('date');
ylabel('cases');
xticks([0 floor(N/3) floor(2*N/3) N])
xticklabels({[l0],[l1],[l2],[lf]})
legend('Total Cases','Active Cases','Discharged','Location','northwest');

% Plot the results. 
L0=datestr(df,'dd mmm yyyy');
L1=datestr(df+days(2*7),'dd mmm yyyy');
L2=datestr(df+days(4*7),'dd mmm yyyy');
subplot(1,2,2);
plot(t,u(:,2)+u(:,3),t,u(:,2),t,u(:,3),'LineWidth',2); 
title('SIR model for COVID-19 in Japan (125M)','data sourced by Japanese Ministry of Health');
xticks([0 2*7 4*7]);
xticklabels({[L0],[L1],[L2]});
xlabel('date');
ylabel('cases');
legend('Total Cases','Active Cases','Discharged','Location','east');
