function [ Msource,Nsource ] = Enertime_TrouveCoordSource(lon_,lat_,...
                                               LonSource,LatSource)
%Recherche le point le plus près de la source positionnée en LonSource et
%LatSource

    d=110000*sqrt((cos(LatSource*pi/180).*(lon_-LonSource)).^2+...
                  (lat_-LatSource).^2);
    [M,N]=size(d);d_=reshape(d,M*N,1);
    [Dmin,I]=min(d_);
    Nsource=floor(I/M)+1;Msource=I-(Nsource-1)*M;
end

