clc
close all

xg = [0,90,120,200,270,272];
yg = [40,50,75,72,51,39];

xd = [0,39,40,55,70,180,196,210,240,272];
yd = [40,10,12,0,11,10,0,13,9,39];

x1 = linspace (0,max(xg),1000);
y1 = interp1(xg,yg,x1,'nearest');

x2 = linspace (0,max(xd),1000);
y2 = interp1(xd,yd,x2,'nearest');

subplot(2,2,1)
plot(xg,yg,'k*',x1,y1,  xd,yd,'k*',x2,y2)






xg = [0,90,120,200,270,272];
yg = [40,50,75,72,51,39];

xd = [0,39,40,55,70,180,196,210,240,272];
yd = [40,10,12,0,11,10,0,13,9,39];

x1 = linspace (0,max(xg),1000);
y1 = interp1(xg,yg,x1,'pchip');

x2 = linspace (0,max(xd),1000);
y2 = interp1(xd,yd,x2,'pchip');

subplot(2,2,2)
plot(xg,yg,'k*',x1,y1,  xd,yd,'k*',x2,y2)







xg = [0,90,120,200,270,272];
yg = [40,50,75,72,51,39];

xd = [0,39,40,55,70,180,196,210,240,272];
yd = [40,10,12,0,11,10,0,13,9,39];

x1 = linspace (0,max(xg),1000);
y1 = interp1(xg,yg,x1,'linear');

x2 = linspace (0,max(xd),1000);
y2 = interp1(xd,yd,x2,'linear');

subplot(2,2,3)
plot(xg,yg,'k*',x1,y1,  xd,yd,'k*',x2,y2)






xg = [0,90,120,200,270,272];
yg = [40,50,75,72,51,39];

xd = [0,39,40,55,70,180,196,210,240,272];
yd = [40,10,12,0,11,10,0,13,9,39];

x1 = linspace (0,max(xg),1000);
y1 = interp1(xg,yg,x1,'spline');

x2 = linspace (0,max(xd),1000);
y2 = interp1(xd,yd,x2,'spline');

subplot(2,2,4)
plot(xg,yg,'k*',x1,y1,  xd,yd,'k*',x2,y2)


