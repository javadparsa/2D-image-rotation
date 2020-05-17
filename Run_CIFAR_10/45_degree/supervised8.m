function [X_tra, Y_tra] = supervised8(XTrain)
aw = 8*size(XTrain,4);
X_tra = zeros(32,32,3,aw);
Y_tra = zeros(aw,1);
for i=1:size(XTrain,4)
    a = XTrain(:,:,:,i);
    for j =8:-1:1
        diff = fix(j/2)-(j/2);
        if diff~=0
            img = imrotate(a,45*(8-j));
            [dim1,dim2] = size(img,1,2);
            X_tra(:,:,:,8*i-j+1) = (img(fix(dim1/2)-15:fix(dim1/2)+16,fix(dim2/2)-15:fix(dim2/2)+16,:));
            Y_tra(8*i-j+1,1) = 45*(8-j);
        else
           img1 = imrotate(a,45*(8-j));
           X_tra(:,:,:,8*i-j+1) = (img1); 
           Y_tra(8*i-j+1,1) = 45*(8-j);
       end
    end
end
X_tra = uint8(X_tra);
end