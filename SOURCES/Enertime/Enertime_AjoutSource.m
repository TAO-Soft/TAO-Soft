Q=zeros(M,N).*rmask_; 
% Q(M_source,N_source)=(Conc_Source-q(M_source,N_source))....
%                      *Enertime_Debit * dt /dl/dl /h_source;
Q(M_source,N_source)=(Conc_Source)....
                     *Enertime_Debit * dt /dl/dl /h_source;
q=q+Q;

