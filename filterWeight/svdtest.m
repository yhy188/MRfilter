dd=[1,2,3,4;5,6,7,8];
D=reshape(dd,1,8);
[uu,ss,vv]=svd(dd);
ddp=uu(:,1)*ss(1,1)*vv(:,1)'+uu(:,2)*ss(2,2)*vv(:,2)';
