clc,clear all,close all;
r=13*(1/10);
l=167*(1/10);
x=5:1:105;
L=l/r;
for k=1:length(x)
   H(k)=x(k)/r;
   X(k)=(1+H(k))^2+L^2;
   Y(k)=(1-H(k))^2+L^2;
   M(k)=sqrt((H(k)-1)/(H(k)+1));
   F(k)=(L/(pi*H(k)))*(((1/L)*atan(L/(sqrt(H(k)^2-1))))-(atan(M(k)))+((X(k)-2*H(k))/(sqrt(X(k)*Y(k))))*atan(M(k)*sqrt(X(k)*Y(k))));
end
Ir=(2.3*1e6)/(2*pi*r*l)*F;
figure(1)
plot(x,Ir,"k--")
grid on
legend('I')
title('Single Stage Decay')
xlabel('Distance [cm]'); ylabel('[Irradiance uW/cm^2]');
Ir=(Ir*100^2)/(1E6);
Et=0:0.1:30;
D=Et*Ir(101)*0.5;
D1=Et*Ir(50)*0.5;
figure(2)
plot(Et,D,"k--",Et,D1,"r--");
grid on
legend('D1','D2');
title('Exposure Dose ')
xlabel(' Et[s]'); ylabel('[D J/M^2]');
k=0.0501;
S=exp(-k*D);
S1=exp(-k*D1);
figure(3);
plot(D,S,"K--");
grid on
legend('S2');
title('Single Stage Decay')
xlabel('[D J/M^2]'); ylabel('[S]');
figure(4)
plot(D1,S1,"r--");
grid on
legend('S2');
title('Single Stage Decay')
xlabel('[D J/M^2]'); ylabel('[S]');
figure(5)
plot(Et,S,"k--",Et,S1,"r--")
grid on
legend('S1 100 cm','S2 54 cm');
title('Single Stage Decay')
xlabel('Et[s]'); ylabel('[S]');
colorbar
