tt1=0;
    if~exist('PremierFichier')
        PremierFichier='true'
    end

    if (PremierFichier)
            T2=T_His(N1_His)+T0;
            ubar2=squeeze(nc{'ubar'}(N1_His,:,:));
            vbar2=squeeze(nc{'vbar'}(N1_His,:,:));
            zeta2=squeeze(nc{'zeta'}(N1_His,:,:));    
            PremierFichier=false;
    else
            N1_his=N1_His-1;
    end

  for indFich=1:NbFich_
    if (~MultiFichier)
            N1_His_=N1_His;
            N2_His_=N2_His;
    else
            %Hisname=[DossierResultats 'his_GG96_' num2str(indFich) '.nc'];
            Hisname=Nom(indFich,:);
             ParcMarin_InitialisationTemps
            if (indFich~=1)
                T0=T2+min(diff(T_His));
            end 
            N1_His_=max(N1_His,1);            
            N2_His_=size(T_His,1);
    end

     for ind_his=N1_His_:N2_His_-1;
       % ind_his
    %       disp([(T0+T_His(ind_his))/3600/24....
    %          Concentration(index-1) ...
    %          AgeMoy(index-1,1)/3600/24 AgeMoy(index-1,2)/3600/24 ]);

          if (DeleersExtend_OnContinue)
            T1=T2;
            ubar1=ubar2;
            vbar1=vbar2;
            zeta1=zeta2;    

            T2=T_His(ind_his+1)+T0;
            disp(['Heure :' num2str([T1 T2 T0]/3600)...
                  '   - Conc : ' num2str(QtotVerif_OnContinue)])
            if T1/3600 == 125
                disp('coucou')
            end
            ubar2=squeeze(nc{'ubar'}(ind_his+1,:,:));
            vbar2=squeeze(nc{'vbar'}(ind_his+1,:,:));
            zeta2_=squeeze(nc{'zeta'}(ind_his+1,:,:));
            if (max(max(abs(ubar2)))<10 & max(max(abs(vbar2)<10)))
                zeta2=zeta2_;
            end
            ubar2(abs(ubar2)>10)=0*ubar2(abs(ubar2)>10);
            vbar2(abs(vbar2)>10)=0*vbar2(abs(vbar2)>10);
            h_=h;

            DeleersExtend_AgeOfWaterSurUnPasDeTempsDuFichierHis
            TdessinEnCours=1*24;
            if(mod(ind_his,TdessinEnCours)==0)
               DeleersExtend_Dessin
               pause(0.1)
            end
          else
              disp('Coucou')
          end 
     end
     tt2=floor(size(TMat,2)/4);
     tt3=floor(2*size(TMat,2)/4);
     tt4=floor(3*size(TMat,2)/4);
     aa=TMat(tt1+1:tt2);
     bb=ConcMat(:,:,:,tt1+1:tt2);
     cc=AgeMat(:,:,:,tt1+1:tt2);
         save (['Sauvegarde' num2str(indFich) '_1'],'AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat','aa',...
                                       'bb',...
                                       'cc')
     aa=TMat(tt2+1:tt3);
     bb=ConcMat(:,:,:,tt2+1:tt3);
     cc=AgeMat(:,:,:,tt2+1:tt3);
         save (['Sauvegarde' num2str(indFich) '_2'],'AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat','aa',...
                                       'bb',...
                                       'cc')
     aa=TMat(tt3+1:tt4);
     bb=ConcMat(:,:,:,tt3+1:tt4);
     cc=AgeMat(:,:,:,tt3+1:tt4);
         save (['Sauvegarde' num2str(indFich) '_3'],'AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat','aa',...
                                       'bb',...
                                       'cc')
     aa=TMat(tt4+1:end);
     bb=ConcMat(:,:,:,tt4+1:end);
     cc=AgeMat(:,:,:,tt4+1:end);
         save (['Sauvegarde' num2str(indFich) '_4'],'AgeMoy','AgeTotMoy','Age','AgeTot',...
                                'Concentration','Q','Qtot',...
                                'Milieu','Lagon','DT',...
                                    'lon','lat','aa',...
                                       'bb',...
                                       'cc')

       tt1=size(TMat,2)
end
  DeleersExtend_Dessin



