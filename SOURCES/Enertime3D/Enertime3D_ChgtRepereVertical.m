% [Iu,Ju]=size(Utemp);
% [Iv,Jv]=size(Vtemp);

if CoordonneeZ
    for i_Chgt = 1:Imax-Imin+1
        for j_Chgt = 1:Jmax-Jmin+1 
            if(h(i_Chgt,j_Chgt)>0)
                Utemp=Enertime3D_ChgtRepereVert(...
                             u3D_(:,min(i_Chgt,Iu),min(j_Chgt,Ju)),sigma*h(i_Chgt,j_Chgt),Z);
                Vtemp=Enertime3D_ChgtRepereVert(...
                             v3D_(:,min(i_Chgt,Iv),min(j_Chgt,Jv)),sigma*h(i_Chgt,j_Chgt),Z);
                u3D(:,i_Chgt,j_Chgt)=Utemp;
                v3D(:,i_Chgt,j_Chgt)=Vtemp;
                Umax(:,i_Chgt,j_Chgt)=max(Umax(:,min(i_Chgt,Iu),min(j_Chgt,Ju)),abs(Utemp));
                Vmax(:,i_Chgt,j_Chgt)=max(Vmax(:,min(i_Chgt,Iv),min(j_Chgt,Jv)),abs(Vtemp));
            else
                u3D(:,i_Chgt,j_Chgt)=0*Z;
                v3D(:,i_Chgt,j_Chgt)=0*Z;
                
            end
        end
    end
end
if CoordonneeSigma
    u3D=u3D_(iSigma,:,:);
    v3D=v3D_(iSigma,:,:);
    % u3D=ones(size(u3D))*debit/dl;
    % v3D=ones(size(v3D))*0;
end
