q=zeros(M,N).*rmask;alpha=zeros(M,N).*rmask;
q_lim1_N=ones(M,1)*Concentration0;alpha_lim1_N=ones(M,1)*0;
q_lim2_N=ones(M,1)*Concentration0;alpha_lim2_N=ones(M,1)*0;
q_lim1_M=ones(1,N)*Concentration0;alpha_lim1_M=ones(1,N)*0;
q_lim2_M=ones(1,N)*Concentration0;alpha_lim2_M=ones(1,N)*0;

q(Ocean==1)=Concentration0;
alpha(Ocean==1)=0;


