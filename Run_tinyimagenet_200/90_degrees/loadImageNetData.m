function [XTrain,YTrain,XTest,YTest] = loadImageNetData(location)

location = fullfile(location,'tiny_imagenet');

[XTrain,YTrain] = loadBatchAsFourDimensionalArray(location,'train.mat');
[XTest,YTest] = loadBatchAsFourDimensionalArray(location,'test.mat');
end

function [XBatch,YBatch] = loadBatchAsFourDimensionalArray(location,batchFileName)
s = load(fullfile(location,batchFileName));
XBatch = s.data';
XBatch = reshape(XBatch,32,32,3,[]);
XBatch = permute(XBatch,[2 1 3 4]);
YBatch = convertLabelsToCategorical(location,s.fine_labels);
end

function categoricalLabels = convertLabelsToCategorical(location,integerLabels)
s = load(fullfile(location,'meta.mat'));
categoricalLabels = categorical(integerLabels,0:99,s.fine_label_names);
end

