%close all
%clear all
% ATTENTION dt doit être un diviseur de DT_His, par exemple, le pas de temps%%
DeleersExtend_DefinitionNom
if ~exist('dt','var') 
    dt=2;%*60/3600;
end
N1dV = 0;
N2dH = 1;
dt_=dt;
if exist('MES','var') 
    if (MES) 
        if ~exist('Nu','var') 
            Nu=0;%*60/3600;
        end
        if size(Wch,1)==1 
            Wch=Wch(1)*ones(size(Z,1)+1,1);%*60/3600;
        end
        
        dt1dV=CalculPasDeTemps(Wch,Nu,dz,3600);
        N1dV = max(round(dt/dt1dV),1);
        N2dH = max(round(dt1dV/dt),1);
        if N1dV==1
            dt_ = N2dH*dt;
            dt1dv = N2dH*dt;
        end
        if N2dH==1
            dt_ = N1dV*dt1dv;
            dt = N1dV*dt1dv;
        end
    end
end

%Decroissance=(1-1/exp(1));
%Decroissance=75/100;
%Decroissance=0.25;

ParcMarin_InitialisationDomaine
Enertime3D_DefinitionSource
Zeta_Verif=0;
M=(M-1)*nx+1;N=(N-1)*nx+1;
% Conc_Domaine=5;
if (Relance==0)
    q3D=ones(M,N,K)*Conc_Domaine;%.*rmask;
    Depot=ones(M,N)*Conc_Domaine;%.*rmask;
    q=ones(M,N)*Conc_Domaine;%.*rmask;
    clear ConcDomaine 
else
    q3D=ConcDomaine(:,:,:,end);%.*rmask;
    q=ones(M,N,K)*Conc_Domaine;%.*rmask;
    clear ConcDomaine 
    t_sauv=t_sauv(end);
end
Concentration0=q3D(2:end-1,2:end-1,:);
q_lim1_N=ones(M,1)*Conc_Domaine;
q_lim2_N=ones(M,1)*Conc_Domaine;
q_lim1_M=ones(1,N)*Conc_Domaine;
q_lim2_M=ones(1,N)*Conc_Domaine;
Diff=zeros(M,N);

N_T2=0;
%lon_=lon(2:end-1,2:end-1);lat_=lat(2:end-1,2:end-1);
Enertime_OnContinue=true;

Umax=0*ones(K,Imax-Imin+1,Jmax-Jmin+1);Vmax=Umax;
Enertime3D_DefinitionVariablesFichiersLecture
%hh(87:88,184)=1;rmCr(86:88,183:184)=1;
index=0;N_Tmax=4;
while Enertime_OnContinue
  N_T2*(T2_His-T1_His)
  Enertime3D_TransportSurUnMois
  Enertime3D_TransportSurUnMois_Connexion
  % Enertime_Dessin
  N_T2=N_T2+1;
  if (N_T2>N_Tmax)
    Enertime_OnContinue=false;
  end
  if (N_T2<=18)
    %index=0;
  end
  Enertime3D_Sauvegarde
end
 save ../DessinsEtSauvegarde/FichiersSauvegarde3D ...
      t_sauv ConcDomaine lon lat lon_ lat_ rmask rmask_ ...
      M_source N_source Debit2016 Erreur T90 Wch
 Enertime3D_Dessin
