function [X_tra, Y_tra] = supervised(XTrain)
X_tra = zeros(32,32,3,200000);
Y_tra = zeros(200000,1);
for i=1:size(XTrain,4)
    a = XTrain(:,:,:,i);
    X_tra(:,:,:,4*i-3) = a;
    Y_tra(4*i-3,1) = 1;
    X_tra(:,:,:,4*i-2) = permute(a,[2 1 3]);
    X_tra(:,:,:,4*i-2) = flipud(X_tra(:,:,:,4*i-2));
    Y_tra(4*i-2,1) = 2;
    X_tra(:,:,:,4*i-1) = permute(a,[1,2,3]);
    X_tra(:,:,:,4*i-1) = flipud(X_tra(:,:,:,4*i-1));
    X_tra(:,:,:,4*i-1) = fliplr(X_tra(:,:,:,4*i-1));
    Y_tra(4*i-1,1) = 3;
    X_tra(:,:,:,4*i) = flipud(a);
    X_tra(:,:,:,4*i) = permute(X_tra(:,:,:,4*i),[2 1 3]);
    Y_tra(4*i,1) = 4;
end
X_tra = uint8(X_tra);
end