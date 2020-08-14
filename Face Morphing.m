function out=A2b_Ruchika_2018csb1117_2020_CS517(fname_inp1,fname_inp2,tpts,fname_out,toshow)
A1=imread(fname_inp1);
B1=imread(fname_inp2);
A=rgb2gray(A1);
B=imresize(rgb2gray(B1),size(A));
%B=imresize(B1,[1116 990]);
AA=uint8(zeros(size(A)));
BB=uint8(zeros(size(B)));
g=1116;
h=990;

 SM=[519 223;534 387;487 300;535 294;535 555;516 717;489 640;540 640;721 375;765 468;720 561;846 327;931 466;847 606;838 468;1078 469;126 472;946 228;1 1;1 990;1116 1;1116 990];
SN=[565 372;567 453;531 412;583 411;570 552;564 640;529 592;585 595;754 460;795 507;754 562;886 441;945 570;874 579;853 571;1080 519;234 507;928 351;1 1;1 990;1116 1;1116 990];
 
SI=(size(SM));
SI1=(size(SM));
a=.5;
for i=1:22
    for j=1:2
        SI(i,j)=round((1-a).*SM(i,j)+a.*SN(i,j));
    end
end

SI1=SI;       
d=delaunay(SM);
d1=delaunay(SN);
n=size(d);
n1=n(1,1);
C=zeros(n1,6);
C1=zeros(n1,6);
TR=triangulation(d,SM);
TR1=triangulation(d1,SN);
k=n(1,2);
for i=1:n1
%i=1;
    p=d(i,1);
    q=d(i,2);
    r=d(i,3);
    ax=SM(p,1);
    bx=SM(q,1);
    cx=SM(r,1);
    ay=SM(p,2);
    by=SM(q,2);
    cy=SM(r,2); 
    rx=SI(p,1);
    sx=SI(q,1);
    tx=SI(r,1);
    ry=SI(p,2);
    sy=SI(q,2);
    ty=SI(r,2);
    P=[ax bx cx;ay by cy;1 1 1];
    Q=[rx sx tx;ry sy ty;1 1 1];
    T=Q*inv(P);
   
   C(i,1)=T(1,1);
   C(i,2)=T(1,2); 
   C(i,3)=T(1,3);
   C(i,4)=T(2,1);
   C(i,5)=T(2,2);
   C(i,6)=T(2,3);
end

for i=1:n1
%i=1;
    p1=d1(i,1);
    q1=d1(i,2);
    r1=d1(i,3);
    ax1=SN(p1,1);
    bx1=SN(q1,1);
    cx1=SN(r1,1);
    ay1=SN(p1,2);
    by1=SN(q1,2);
    cy1=SN(r1,2); 
    rx1=SI1(p1,1);
    sx1=SI1(q1,1);
    tx1=SI1(r1,1);
    ry1=SI1(p1,2);
    sy1=SI1(q1,2);
    ty1=SI1(r1,2);
     P1=[ax1 bx1 cx1;ay1 by1 cy1;1 1 1];
    Q1=[rx1 sx1 tx1;ry1 sy1 ty1;1 1 1];
    T1=Q1*inv(P1);
   
   C1(i,1)=T1(1,1);
   C1(i,2)=T1(1,2); 
   C1(i,3)=T1(1,3);
   C1(i,4)=T1(2,1);
   C1(i,5)=T1(2,2);
   C1(i,6)=T1(2,3);
    
   
end

for i=1:1116
    for j=1:990
        id=pointLocation(TR,i,j);
      
       x=round(C(id,1).*i+C(id,2).*j+C(id,3));
        y=round(C(id,4).*i+C(id,5).*j+C(id,6));
      %  x=round((C(id,5).*i-C(id,2).*j-C(id,3).*C(id,5)-C(id,2).*C(id,6))/(C(id,1).*C(id,5)-C(id,2).*C(id,4))); 
       % y=round((C(id,4).*i-C(id,1).*j-C(id,3).*C(id,4)-C(id,1).*C(id,6))/(C(id,2).*C(id,4)-C(id,5).*C(id,1)));
        
        x=max(x,1);
        x=min(g,x);
        y=max(y,1);
        y=min(y,h);
        AA(x,y)=A(i,j);
       %disp(AA(i,j));
        
        
    end
end
for i=1:1116
    for j=1:990
        id1=pointLocation(TR1,i,j);
       % disp(id);
       x1=round(C1(id1,1).*i+C1(id1,2).*j+C1(id1,3));
        y1=round(C1(id1,4).*i+C1(id1,5).*j+C1(id1,6));
      %  x=round((C(id,5).*i-C(id,2).*j-C(id,3).*C(id,5)-C(id,2).*C(id,6))/(C(id,1).*C(id,5)-C(id,2).*C(id,4))); 
       % y=round((C(id,4).*i-C(id,1).*j-C(id,3).*C(id,4)-C(id,1).*C(id,6))/(C(id,2).*C(id,4)-C(id,5).*C(id,1)));
        
        x1=max(x1,1);
        x1=min(g,x1);
        y1=max(y1,1);
        y1=min(y1,h);
        BB(x1,y1)=B(i,j);
       %disp(AA(i,j));
        
        end
end

for i=1:1116
    for j=1:990
        if (AA(i,j)<10)
            AA(i,j)=150;
        end
    end
end
for i=1:1116
    for j=1:990
        if(BB(i,j)<10)
            BB(i,j)=150;
        end
    end
end

ImageCell={11,1};
for i=0:10
    al=i/10;
    CC=(1-al)*AA+al*BB;
    ImageCell{i+1}=CC;
end
Filename='facemor';
for k=1:numel(ImageCell)
    if k==1
        imwrite(ImageCell{k},Filename,'gif','LoopCount',Inf,'DelayTime',.2);
    else
        imwrite(ImageCell{k},Filename,'gif','WriteMode','append','DelayTime',.2);
    end
end
if(toshow)
   figure;
    for i=1:11
       subplot(3,4,i);imshow(ImageCell{i});
    end
end


    
end