if ~exist('Ksource','var'),Ksource=1;end
Q=zeros(M,N,K).*rmask_; 
% Q(M_source,N_source)=(Conc_Source-q(M_source,N_source))....
%                      *Enertime_Debit * dt /dl/dl /h_source;
 J1=floor(t/24/3600);J1=mod(J1,366);
 J2=floor(t/24/3600)+1;J2=mod(J2,366);
 debit=((J1+1)*24*3600-t)/(24*3600)*Enertime_Debit(J1+1)+...
                       (t-J1*24*3600)/(24*3600)*Enertime_Debit(J2+1);
% % debit=1500/24/3600;
% % debit=Enertime_Debit;

%if(t/3600>24),debit=0;end

%position du rejet : ici considéré au point 1 
% ==> mais il pourrait etre déterminé autrement 
for k=Ksource;
    for ii=1:NbSources
        Q(M_source(ii),N_source(ii),k)=dt * dz /dl/dl/h_source *...
                         Conc_Source.*debit/NbSources;
    end
end

%Ajout source:
for ii=1:NbSources
    q3D(M_source,N_source,:)=q3D(M_source,N_source,:)+Q(M_source,N_source,:);
end

