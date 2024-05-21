if~exist('Model')
    Model='Croco'
end
if strcmp(Model,'Croco')==1
%     Ubar='ubar';
%     Vbar='vbar';
    Ubar='u';
    Vbar='v';
    Zeta='zeta';
    Temps='scrum_time';
end
if strcmp(Model,'Mars')==1
    Ubar='U';
    Vbar='V';
    Zeta='XE';
    Temps='time';
end
if strcmp(Model,'Mars3D')==1
    Ubar='UZ';
    Vbar='VZ';
    Zeta='XE';
    Temps='time';
end