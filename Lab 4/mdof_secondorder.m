function dq = mdof_secondorder(t,q)

global m1 c1 k1 m2 c2 k2 k3 %global variables defined in the main .m program


dq=zeros(4,1);% initialize the length of the number of states (column vector)

%A=[0 1 0 0;-(k1+k2)/m1 -c1/m1 k2/m1 0;0 0 0 1;k2/m2 0 -(k3+k2)/m2 -c2/m2];
%B=[0;1/m1;0;0];
%C=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
%D=[0;0;0;0];



%% Define the system of differential equations using the defined states and 
%  the governing equations of motion of the system
dq(1)=q(2);
dq(2)=1/m1*(-(k1+k2)*q(1)-c1*q(2)+k2*q(3))+forcing_mdof(t)/m1;
dq(3)=q(4);
dq(4)=1/m2*(k2*q(1)-(k2+k3)*q(3)-c2*q(4));

end