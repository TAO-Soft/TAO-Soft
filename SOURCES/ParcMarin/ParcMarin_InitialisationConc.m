q=zeros(M,N).*rmask;
q_lim1_N=ones(M,1)*0;
q_lim2_N=ones(M,1)*0;
q_lim1_M=ones(1,N)*0;
q_lim2_M=ones(1,N)*0;

q(I0-dx0:I0+dx0,J0-dy0:J0+dy0)=30*rmask(I0-dx0:I0+dx0,J0-dy0:J0+dy0);
