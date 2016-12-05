%%ECE 102 - PROJECT PART 1
% Marc Abou Jaoude
%Variables
f = 10:10:1e5;
w = 2 * pi * f;
Rf = 21.22e3;
Ri = Rf;
c = 15e-9;
%High pass
H1 = (-Rf/Ri)*(w*j)./(w*j+1./(Ri*c));
R1 = 10.61e3;
R2 = 42.44e3;
H2 = ((w*j).^2)./((w*j).^2+2/(R2*c)*(w*j)+1/(R1*R2*c^2));
%Low Pass
Rf = 10e3;
Ri = 10e3;
c1 = 3.5e-9;
H3 = (-Rf/Ri)*(1./(Rf*c1))./(w*j+(1./(Rf*c1)));
R = 10e3;
c1 = 7.07e-9;
c2 = 1.77e-9;
H4 = (1/(R^2*c1*c2))./((w*j).^2+2/(R*c1)*(w*j)+1/(c1*c2*R^2));
H5 = -10;
H = H1.*H2.*H3.*H4*H5;
%plots
subplot(2,1,1)
semilogx(f, 20*log10(abs(H)))
grid
xlabel('f (Hz)')
ylabel('|H(f)| dB')
subplot(2,1,2)
semilogx(f, angle(H))
grid
xlabel('f (Hz)')
ylabel('H(f)')
