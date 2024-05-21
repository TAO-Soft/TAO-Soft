load('Sauvegarde7_1.mat')
T=aa;ConcMat1=bb;AgeMat1=cc;
load('Sauvegarde7_2.mat')
T=[T aa];ConcMat2=bb;AgeMat2=cc;
load('Sauvegarde7_3.mat')
T=[T aa];ConcMat3=bb;AgeMat3=cc;
load('Sauvegarde7_4.mat')
T=[T aa];ConcMat4=bb;AgeMat4=cc;
ConcMat=ones(size(bb,1),size(bb,2),size(bb,3),size(aa,2));
AgeMat=ones(size(bb,1),size(bb,2),size(bb,3),size(aa,2));
ConcMat(:,:,:,1:size(ConcMat1,4))=ConcMat1;
AgeMat(:,:,:,1:size(ConcMat1,4))=AgeMat1;
AgeMat(:,:,:,size(ConcMat1,4)+1:size(ConcMat1,4)+size(ConcMat2,4))=AgeMat2;
ConcMat(:,:,:,size(ConcMat1,4)+1:size(ConcMat1,4)+size(ConcMat2,4))=ConcMat2;
ConcMat(:,:,:,size(ConcMat1,4)+size(ConcMat2,4)+1:size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4))=ConcMat3;
AgeMat(:,:,:,size(ConcMat1,4)+size(ConcMat2,4)+1:size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4))=AgeMat3;
AgeMat(:,:,:,size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4)+1:size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4)+size(ConcMat4,4))=AgeMat4;
ConcMat(:,:,:,size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4)+1:size(ConcMat1,4)+size(ConcMat2,4)+size(ConcMat3,4)+size(ConcMat4,4))=ConcMat4;