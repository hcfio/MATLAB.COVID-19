websave('time_series_covid19_confirmed_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv');
websave('time_series_covid19_deaths_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv');
% websave('time_series_covid19_recovered_global.csv','https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv');

A=importdata('time_series_covid19_confirmed_global.csv');
B=importdata('time_series_covid19_deaths_global.csv');
% C=importdata('time_series_covid19_recovered_global.csv');

[pa qa]=size(A.data);
% ATX=A.textdata(2:pa+1,2);
% [pb qb]=size(B.data);
% BTX=B.textdata(2:pb+1,2);
% [pc qc]=size(C.data);
% CTX=C.textdata(2:pc+1,2);

d0=datetime(2020,1,22);
d1=d0+days(qa-3);
D=days(d1-d0);
l0=datestr(d0,'yyyy-mm-dd');
l1=datestr(d0+days(floor(D/3)),'yyyy-mm-dd');
l2=datestr(d0+days(floor(2*D/3)),'yyyy-mm-dd');
l3=datestr(d1,'yyyy-mm-dd');

ddd0=datetime('2021-04-01');
L0=string('2021-04-01');
L1=datestr(ddd0+days(floor((D-435)/2)),'yyyy-mm-dd');
L2=datestr(d1,'yyyy-mm-dd');

% Argentina 8 8
PARG=45.2;
AARG=transpose(A.data(7,3:qa))/PARG;
BARG=transpose(B.data(7,3:qa))/PARG;
NARG=zeros(qa-2,1);
NARG(1,1)=AARG(1,1);
for j=2:qa-2
    NARG(j,1)=max(AARG(j,1)-AARG(j-1,1),0);
end
NDARG=zeros(qa-437,1);
for j=1:qa-437
    NDARG(j,1)=(BARG(j+435,1)-BARG(j+428,1))/7;
end

% Brazil 32 32
PBRA=213;
ABRA=transpose(A.data(31,3:qa))/PBRA;
BBRA=transpose(B.data(31,3:qa))/PBRA;
NBRA=zeros(qa-2,1);
NBRA(1,1)=ABRA(1,1);
for j=2:qa-2
    NBRA(j,1)=max(ABRA(j,1)-ABRA(j-1,1),0);
end
NDBRA=zeros(qa-437,1);
for j=1:qa-437
    NDBRA(j,1)=(BBRA(j+435,1)-BBRA(j+428,1))/7;
end

% Colombia 93 78
PCOL=50.9;
ACOL=transpose(A.data(93,3:qa))/PCOL;
BCOL=transpose(B.data(93,3:qa))/PCOL;
NCOL=zeros(qa-2,1);
NCOL(1,1)=ACOL(1,1);
for j=2:qa-2
    NCOL(j,1)=max(ACOL(j,1)-ACOL(j-1,1),0);
end
NDCOL=zeros(qa-437,1);
for j=1:qa-437
    NDCOL(j,1)=(BCOL(j+435,1)-BCOL(j+428,1))/7;
end

% France 131 116
PFRA=65.3;
AFRA=transpose(A.data(131,3:qa))/PFRA;
BFRA=transpose(B.data(131,3:qa))/PFRA;
NFRA=zeros(qa-2,1);
NFRA(1,1)=AFRA(1,1);
for j=2:qa-2
    NFRA(j,1)=max(AFRA(j,1)-AFRA(j-1,1),0);
end
NDFRA=zeros(qa-437,1);
for j=1:qa-437
    NDFRA(j,1)=(BFRA(j+435,1)-BFRA(j+428,1))/7;
end

% Italia 154 139
PITA=60.5;
AITA=transpose(A.data(154,3:qa))/PITA;
BITA=transpose(B.data(154,3:qa))/PITA;
NITA=zeros(qa-2,1);
NITA(1,1)=AITA(1,1);
for j=2:qa-2
    NITA(j,1)=max(AITA(j,1)-AITA(j-1,1),0);
end
NDITA=zeros(qa-437,1);
for j=1:qa-437
    NDITA(j,1)=(BITA(j+435,1)-BITA(j+428,1))/7;
end

% Mexico 183 168
PMEX=129;
AMEX=transpose(A.data(184,3:qa))/PMEX;
BMEX=transpose(B.data(184,3:qa))/PMEX;
NMEX=zeros(qa-2,1);
NMEX(1,1)=AMEX(1,1);
for j=2:qa-2
    NMEX(j,1)=max(AMEX(j,1)-AMEX(j-1,1),0);
end
NDMEX=zeros(qa-437,1);
for j=1:qa-437
    NDMEX(j,1)=(BMEX(j+435,1)-BMEX(j+428,1))/7;
end

% Spain 235 220
PESP=46.8;
AESP=transpose(A.data(238,3:qa))/PESP;
BESP=transpose(B.data(238,3:qa))/PESP;
NESP=zeros(qa-2,1);
NESP(1,1)=AESP(1,1);
for j=2:qa-2
    NESP(j,1)=max(AESP(j,1)-AESP(j-1,1),0);
end
NDESP=zeros(qa-437,1);
for j=1:qa-437
    NDESP(j,1)=(BESP(j+435,1)-BESP(j+428,1))/7;
end

% United Staes 251 236
PUSA=331;
AUSA=transpose(A.data(255,3:qa))/PUSA;
BUSA=transpose(B.data(255,3:qa))/PUSA;
NUSA=zeros(qa-2,1);
NUSA(1,1)=AUSA(1,1);
for j=2:qa-2
    NUSA(j,1)=max(AUSA(j,1)-AUSA(j-1,1),0);
end
NDUSA=zeros(qa-437,1);
for j=1:qa-437
    NDUSA(j,1)=(BUSA(j+435,1)-BUSA(j+428,1))/7;
end

% United Kingdom 266 251
PGBR=67.9;
AGBR=transpose(A.data(270,3:qa))/PGBR;
BGBR=transpose(B.data(270,3:qa))/PGBR;
NGBR=zeros(qa-2,1);
NGBR(1,1)=AGBR(1,1);
for j=2:qa-2
    NGBR(j,1)=max(AGBR(j,1)-AGBR(j-1,1),0);
end
NDGBR=zeros(qa-437,1);
for j=1:qa-437
    NDGBR(j,1)=(BGBR(j+435,1)-BGBR(j+428,1))/7;
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
subplot(2,2,1)
plot([AARG,ABRA,ACOL,AFRA,AITA,AMEX,AESP,AUSA,AGBR],'LineWidth',2)
title('COVID-19 in the World (total cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D]);
xticklabels({[l0],[l1],[l2],[l3]});
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
% plot
subplot(2,2,2)
plot([BARG,BBRA,BCOL,BFRA,BITA,BMEX,BESP,BUSA,BGBR],'LineWidth',2)
title('COVID-19 in the World (death toll per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
% plot
subplot(2,2,3)
plot([NARG,NBRA,NCOL,NFRA,NITA,NMEX,NESP,NUSA,NGBR],'LineWidth',1)
title('COVID-19 in the World (daily new cases per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('cases/1M');
xticks([0 floor(D/3) floor(2*D/3) D])
xticklabels({[l0],[l1],[l2],[l3]})
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
% plot
subplot(2,2,4)
plot([NDARG,NDBRA,NDCOL,NDFRA,NDITA,NDMEX,NDESP,NDUSA,NDGBR],'LineWidth',2)
title('COVID-19 in the World (7-day average deaths per 1M)','data sourced by JHU Coronavirus Resource Center')
xlabel('date');
ylabel('deaths/1M');
xticks([0 floor((D-435)/2) D-435])
xticklabels({[L0],[L1],[L2]})
legend('Argentina','Brazil','Colombia','France','Italy','Mexico','Spain','United States','United Kingdom','Location','northwest');
