

%%xytrains.m
%%images2v_fweightxy_ud2.m

scatter(UD2(:,1),UD2(:,2));
hold on; scatter(UD2(4,1),UD2(4,2));


UD3=[ 16,6;  %16,5; 
    16,7;     16,8; 
    15,7; 
      16,1]; %  14,7;
%%nD=5;
scatter(UD2(:,1),UD2(:,2));
hold on; scatter(UD2(4,1),UD2(4,2));
hold on; scatter(UD3(:,1),UD3(:,2));

%Output: norrxy
ans=round(norrxy,4);
ans_KR=round(log(UD2),4);
ans_yn=ans'+0.01*(ans_KR(:,1)+ans_KR(:,2));


%Output: res
ans_res=round(res,4);
ans_res_KR=round(log(UD2),4);
ans_Qn=ans_res'+0.01*(ans_res_KR(:,1)+ans_res_KR(:,2));



%%%%%%%%%%
%%%%%Input:dfilter16v; fweightxy
%Output: norrxy
ans=round(norrxy,4);
ans_KR=round(log(UD3),4);
ans_yn=ans'+0.01*(ans_KR(:,1)+ans_KR(:,2));


%Output: res
ans_res=round(res,4);
ans_res_KR=round(log(UD3),4);
ans_Qn=ans_res'+0.01*(ans_res_KR(:,1)+ans_res_KR(:,2));


