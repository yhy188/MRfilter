

C=reshape(cc,1,784);
bb=C;
%imagesc(bb);
b=reshape(bb,28,28);
%imagesc(b);

%Fist 16, then random
x=zeros(16,49);


for i=1:16
    if (i<=4)
    a1=(7*(i-1)+1);
    b1=(7*(i-1)+7);
    x(i,1:7)=b(1,a1:b1);
    x(i,8:14)=b(2,a1:b1);
    x(i,15:21)=b(3,a1:b1);
    x(i,22:28)=b(4,a1:b1);
    x(i,29:35)=b(5,a1:b1);
    x(i,36:42)=b(6,a1:b1);
    x(i,43:49)=b(7,a1:b1);
    elseif (4<i && i<=8)
   %     a2=(7*(i-1-4)+1);
  %      b2=(7*(i-4-1)+7);
     x(i,1:7)=b(1+7*1,a1:b1);
    x(i,8:14)=b(2+7*1,a1:b1);
    x(i,15:21)=b(3+7*1,a1:b1);
    x(i,22:28)=b(4+7*1,a1:b1);
    x(i,29:35)=b(5+7*1,a1:b1);
    x(i,36:42)=b(6+7*1,a1:b1);
    x(i,43:49)=b(7+7*1,a1:b1);   
    elseif (8<i && i<=12) 
%       a3=(7*(i-1-8)+1);
 %       b3=(7*(i-1-8)+7);   
    x(i,1:7)=b(1+7*2,a1:b1);
    x(i,8:14)=b(2+7*2,a1:b1);
    x(i,15:21)=b(3+7*2,a1:b1);
    x(i,22:28)=b(4+7*2,a1:b1);
    x(i,29:35)=b(5+7*2,a1:b1);
    x(i,36:42)=b(6+7*2,a1:b1);
    x(i,43:49)=b(7+7*2,a1:b1);   
    elseif (12<i)
 %      a4=(7*(i-1-8)+1);
 %       b4=(7*(i-1-8)+7);    
    x(i,1:7)=b(1+7*3,a1:b1);
    x(i,8:14)=b(2+7*3,a1:b1);
    x(i,15:21)=b(3+7*3,a1:b1);
    x(i,22:28)=b(4+7*3,a1:b1);
    x(i,29:35)=b(5+7*3,a1:b1);
    x(i,36:42)=b(6+7*3,a1:b1);
    x(i,43:49)=b(7+7*3,a1:b1);   
    end        
end
%imagesc(x);


y=reshape(x,1,784);
%imagesc(y);
%second, s: dropout

UD=[];
%nD=8;
%%nD=6;
%%res=[];
UD3=[ 16,6;  %16,5; 
    16,7;    
    16,8; 
    15,7; 
      16,1]; %  14,7;
nD=16;
res=[];

%UD2=[ 16,1; 12,12; 7,7;     16,7;     11,6; 
%    1,1;  4,4; 16,11;5,1;8,4;10,9;8,1;
%      14,4;11,3;13,1;13,9]; 
%UD=UD2;
UD=UD3; nD=5;
[nrun,dim]=size(UD);
norr_run=zeros(nrun,16);
%  norr_run=[];
for index=1:nrun    
    %KK=UD(index,1)*2;
     KK=UD(index,1);
    %RR=KK;
%    RR=UD(index,2)*2;   
    RR=UD(index,2);   

Rep=20;    
for run=1:Rep     %run :  repititions
%N, K, R: setting
%s=round(rand(1,KK)*15+1); %not 0
%[row,KK]=size(s);
%xk=x(s,:);
AA=randperm(16);
A=AA(1:KK);
xk = x(A, :);
II=zeros(16,49);
IIinc=II; 
for ii=1:KK
  IIinc(A,:)=1;    
end

IIincx=reshape(IIinc,1,784);

%%%%%%%%%%%%%%
[U,S,V] = svd(xk);
xnor=norm(xk, 2);
%Ppnor=norm(Pp, 2); 
 Pps=zeros(KK,49);
 Ppnor=[];
 Pxnor=[];
 norr=[];    %important
 norr_runK=[];
for K=1:RR %K=s%
   temp=U(:,K)*S(K,K)*(V(:,K))';
   Pps=Pps+temp;
%   Ppnor(K)=norm(Pps, 2);
%   Pxnor(K)=norm(xk-Pps, 2);
%   norr(K)=Pxnor(K)/xnor;
end
% plot(norr);
%  norr=reshape(norr,1,16); 
%  norr_run(run,1:RR)=norr;
 % Pps=Pps+temp;
  %%%%%%K runs
  PxnorK=norm(xk-Pps, 2);
  norrK=PxnorK/xnor;
  norr_runK(run)=norrK;
end

%norr_mean=mean(norr_run); % mean of multiple Reps
norr_mean=mean(norr_runK);
%plot(norr_mean);

res(index)=norr_mean;


%%%%%%%%%%%c!=x
co=reshape(cc,1,784);
cII=co.*IIincx;
ycp=trainx*cII';



  %%%%%%%%%%%%%%%%%%complete, pps~x !=c
  Aind=zeros(16,1);
  Aind(A)=1;
  PpsX=zeros(16,49);
  for ii=1:KK
  PpsX(A(ii),:)=Pps(ii,:);
  end
%  Ppst=PpsX';
  ppsx1=reshape(PpsX,1,784);
    
  yq=trainx*ppsx1';
  yxq=xy*ppsx1';
 %%%%%%%%%%
%  ypnor=norm(yp, 2);
% ypqnor=norm(yp-yq, 2);
%  norry=ypqnor/ypnor;
  
  %%%%%%%%verify
  yII=y.*IIincx;
   yxpnor=norm(yII, 2);
   %%ppsx1 in order
 yxpqnor=norm(ppsx1-yII, 2);
  norryx=yxpqnor/yxpnor;
  
  yxp=trainx(1,:)*y';
  yxp=xy*y';
  
  %%%%%%%%%
  xypnor=norm(yxp, 2);
   %%ppsx1 in order
 xypqnor=norm(yxq-yxp, 2);
  norrxy(index)=xypqnor/xypnor;
  
end

%%%%%%%%
cre=[];
for index=1:nrun
    cre(index)=res(index)+0.01 * log (KK)+ 0.01 *log (RR); 
cre2(index)=res(index)+ 0.005*(log (KK))+ 0.01 *log (RR);
cre3(index)=res(index)+ 0.01*(log (KK))+ 0.005 *log (RR);
end
%%%%%%%%norrxy on xy
for index=1:nrun
    xyre(index)=norrxy(index)+0.01 * log (KK)+ 0.01 *log (RR); 
xyre2(index)=norrxy(index)+ 0.005*(log (KK))+ 0.01 *log (RR);
xyre3(index)=norrxy(index)+ 0.01*(log (KK))+ 0.005 *log (RR);
end

plot(res);
hold on;plot(cre);
hold on; plot(cre2);
hold on; plot(cre3);
tt=res';
tt2=cre';

%%%%%%%%%%%%%%%%%%%%
credf=[];
credf(:,1)=UD(:,1);
credf(:,2)=UD(:,2);
credf(:,3)=cre;

%surfc(credf)
plot3(credf(:,1),credf(:,2),credf(:,3))
plot(credf(:,1),credf(:,3))
plot(credf(:,2),credf(:,3))

plot(U(:,1)); hold on; plot(U(:,2)); hold on; 
    plot(U(:,3)); 
    
%%V: filter
plot(V(1,:));hold on; plot(V(2,:)); hold on; 
    plot(V(3,:)); 
    %%%%%%%
 surfl(reshape(V(1,:),7,7));
 hold on; surfl(reshape(V(2,:),7,7)); 
 hold on; 
    surfl(reshape(V(3,:),7,7)); 
%imagesc(xk);

