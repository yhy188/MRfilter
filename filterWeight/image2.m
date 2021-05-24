C=reshape(cc,1,784);
bb=C;
imagesc(bb);
b=reshape(bb,28,28);
imagesc(b);


x=zeros(16,49);
K=28/7;
for i=1:1:16
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
    elseif (4<i<=8)
   %     a2=(7*(i-1-4)+1);
  %      b2=(7*(i-4-1)+7);
     x(i,1:7)=b(1+7*1,a1:b1);
    x(i,8:14)=b(2+7*1,a1:b1);
    x(i,15:21)=b(3+7*1,a1:b1);
    x(i,22:28)=b(4+7*1,a1:b1);
    x(i,29:35)=b(5+7*1,a1:b1);
    x(i,36:42)=b(6+7*1,a1:b1);
    x(i,43:49)=b(7+7*1,a1:b1);   
    elseif (8<i<=12) 
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
imagesc(x);

y=reshape(x,1,784);
imagesc(y);

[U,S,V] = svd(x);
Pp=U(:,1)*S(1,1)*(V(:,1))'; 
%Pp=U(:,1)*S(1,1)*t(V(:,1)) +U(:,2)*S(2,2)*t(V(:,2));
Pp3=U(:,1)*S(1,1)*(V(:,1))'+U(:,2)*S(2,2)*(V(:,2))'+U(:,3)*S(3,3)*(V(:,3))';
xnor=norm(x, 2);
Ppnor=norm(Pp, 2);

Pxnor=norm(x-Pp, 2);
norr=Pxnor/xnor;
imagesc(Pp);
imagesc(x);
imagesc(Pp3);
 
 Pps=zeros(16,49);
for K=1:16
   temp=U(:,K)*S(K,K)*(V(:,K))';
   Pps=Pps+temp;
   Ppnor(K)=norm(Pps, 2);
   Pxnor(K)=norm(x-Pps, 2);
   norr(K)=Pxnor(K)/xnor;
end


%N, K, R: setting



