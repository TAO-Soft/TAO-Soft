function dt=CalculPasDeTemps(u,Nu,dx_,dtmax);

    dx=min(dx_);
    u0_=max(u);Nu0_=max(Nu);
    if u0_~=0 & Nu0_~=0; 
       dt=min(dx/abs(u0_)*0.5,dx*dx/(2*Nu0_)*0.5); 
    elseif u0_==0 & Nu0_~=0; 
       dt=dx*dx/(2*Nu0_)*0.5;
    elseif u0_~=0 & Nu0_==0; 
       dt=min(dx/abs(u0_)*0.5,dx*dx/(2*Nu0_)*0.5); 
    else, 
       dt=dtmax;
    end
