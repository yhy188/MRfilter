xy=[];

for iii=1:2060
xx=trainx(iii,:);
C=reshape(xx,1,784);
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


xy(iii,:)=reshape(x,1,784);

end


%%%%%%%%%random: filtertsvd.mat
d=V(:,1); %tSVD, V1=w; RR=1; KK=16
Dd=reshape(d,7,7);
save('tsvd16k1r.mat','Dd'); 
mesh(Dd);

n=2060;
ID=[1:4];
for ii=1:4
     if (ID(ii)==1) 
        wt=reshape(Dd,1,49);
     elseif (ID(ii)==2) 
        wt=reshape(a,1,49);
     elseif (ID(ii)==3) 
        wt=reshape(b,1,49);
     else (ID(ii)==4) 
        wt=reshape(c,1,49);    
     end   
    for i=1:n    
       for k=1:16
           sum=0;
           for m=1:49
           j=(k-1)+m;
           temp=(xy(i,j).*wt(m));
           sum=sum+temp;
           end
           z(i,k)=sum;
       end
    end
    
  if (ID(ii)==1) 
        tsvdz=z;
     elseif (ID(ii)==2) 
       gz=z;
     elseif (ID(ii)==3) 
      logdz=z;
     else (ID(ii)==4) 
       nnz=z;    
     end      
end
    
save('tsvdz.mat','tsvdz'); 
save('gz.mat','gz'); 
save('logdz.mat','logdz'); 
save('nnz.mat','nnz'); 


%%%%%%%%%%%%%%%%%U:7

krdfilterz=zeros(2060,16);
n=2060;
ID=[1:7];
for ii=1:7
     if (ID(ii)==1) 
        wt=V(:,1);
     elseif (ID(ii)==2) 
        wt=V(:,2);
     elseif (ID(ii)==3) 
        wt=V(:,3);
      elseif (ID(ii)==4) 
        wt=V(:,4);
      elseif (ID(ii)==5) 
        wt=V(:,5);   
     elseif (ID(ii)==6) 
        wt=V(:,6);
     else (ID(ii)==7) 
        wt=V(:,7);  
     end   
    for i=1:n    
       for k=1:16
           sum=0;
           for m=1:49
           j=(k-1)+m;
           temp=(xy(i,j).*wt(m));
           sum=sum+temp;
           end
           z(i,k)=sum;
       end
    end
    
  if (ID(ii)==1) 
        krdfilter1z=z;
     elseif (ID(ii)==2) 
         krdfilter2z=z;
     elseif (ID(ii)==3) 
        krdfilter3z=z;
      elseif (ID(ii)==4) 
        krdfilter4z=z;
      elseif (ID(ii)==5) 
        krdfilter5z=z;  
     elseif (ID(ii)==6) 
        krdfilter6z=z;
     else (ID(ii)==7) 
         krdfilter7z=z;
  end      
    temp=z;
    krdfilterz=krdfilterz+z;
end
mesh(xy);
mesh(krdfilterz);

save('xy.mat','krdfilterz'); 


