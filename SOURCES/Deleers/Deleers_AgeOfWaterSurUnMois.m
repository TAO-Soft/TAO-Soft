for ind_his=1:size(T_His)-1;
%       disp([(T0+T_His(ind_his))/3600/24....
%          Concentration(index-1) AgeMoy(index-1)/3600/24]);

      if (Deleers_OnContinue)
        T1=T_His(ind_his);
        ubar1=squeeze(nc{'ubar'}(ind_his,:,:));
        vbar1=squeeze(nc{'vbar'}(ind_his,:,:));
        zeta1=squeeze(nc{'zeta'}(ind_his,:,:));    

        T2=T_His(ind_his+1);
        ubar2=squeeze(nc{'ubar'}(ind_his+1,:,:));
        vbar2=squeeze(nc{'vbar'}(ind_his+1,:,:));
        zeta2=squeeze(nc{'zeta'}(ind_his+1,:,:));
        h_=h;
        
        Deleers_AgeOfWaterSurUnPasDeTempsDuFichierHis


      end 
end
Deleers_Dessin



