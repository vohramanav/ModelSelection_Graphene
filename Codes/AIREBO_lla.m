close all;
clear all;

rng(123);

% AIREBO Potential Parameters and their nominal values
rcc_min = 1.7; rcc_max = 2.0;
Nc_min = 3.2; Nc_max = 3.7;
N_min = 2.0; N_max = 3.0;
s_min = 0.1;
rccp_max = 2.0;
sigma_cc = 3.40;
rccLJ_min = sigma_cc; rccLJ_max = (2.^(1.0./6.0)).*sigma_cc;
bcc_min = 0.77; bcc_max = 0.81;
Q_ij = 0.313460;
alpha_ij = 4.7465391;
A_ij = 10953.544;
B1_ij = 12388.792;B2_ij = 17.567065;B3_ij = 30.714932;
beta1_ij = 4.7204523;beta2_ij = 1.4332132;beta3_ij = 1.3826913;
eps_ij = 0.00284;
sigma_ij = 3.40;
eps_i_cc_j = 0.3079;

m = 24;
k = m+1;
alpha = 3;
M = floor( alpha *k * log(m) );

nom = [rcc_min,rcc_max,Nc_min,Nc_max,N_min,N_max,...
       s_min,rccp_max,rccLJ_min,rccLJ_max,bcc_min,bcc_max,...
       Q_ij,alpha_ij,A_ij,B1_ij,B2_ij,B3_ij,...
       beta1_ij,beta2_ij,beta3_ij,eps_ij,sigma_ij,eps_i_cc_j];

L = zeros(1,m); U = zeros(1,m);
L(1,:) = 0.99.*nom(1,:); U(1,:) = 1.01.*nom(1,:);

N = 20; % 20 samples in the 12D parameter space

% generate 20 samples in [-1,1]
xi  = -1 + 2*lhsdesign(N,m);
y = -1 + 2 * lhsdesign(M,m);

pts_x = gen_samples(xi,L,U);

function pts_x = gen_samples(xi,L,U)
pts_x = zeros(size(xi,1),size(xi,2));

for i = 1:size(pts_x,1)
  for j = 1:size(pts_x,2)
    pts_x(i,j) = L(1,j) + 0.5*(U(1,j)-L(1,j)).*(xi(i,j)+1);
  end
end

% Save physical points to a file
save('pts_airebo_N1_20.txt','pts_x','-ASCII');
%save('pts_val.txt','pts_x','-ASCII');

end



