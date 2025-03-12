clear;clc;close all
if exist('cifar10\')~=7
   [trainDirectory,testDirectory] = downloadCIFARToFolders(pwd);
end

cd('cifar10')
imds = imageDatastore('train','IncludeSubfolders',true,'LabelSource','foldernames'); 
[imdsTrain,imdsValidation] = splitEachLabel(imds,0.9);
imdsTest = imageDatastore('test','IncludeSubfolders',true,'LabelSource','foldernames'); 

% specify the number of images to display
numDisplay=36;
numTrain=numel(imdsTrain.Files);
% the randperm function returns a randomized permutation of integers
idx=randperm(numTrain,numDisplay);
% loop over the index
figure
for i=1:numDisplay
   Input=readimage(imdsTrain,idx(i));
   class=cellstr(imdsTrain.Labels(idx(i)));
   subplot(6,6,i)
   imshow(Input);title(class{1})
end

numFilters=75;
layers = [
    % image input layer whose input size is 32-32-1. "3" represents one
    % color channel (RGB image)
    imageInputLayer([32 32 3]) 
    % convolutional layer whose filter size is 3 by 3 
    convolution2dLayer(3,numFilters,'Padding','same')
    % batch normalization layer
    batchNormalizationLayer
    % activation layer (relu)
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,numFilters*2,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,numFilters*4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

analyzeNetwork(layers)

addpath("D:\External downlodes\Telegram Desktop\CutOutAug.m")


miniBatchSize = 300;
imdsTrain.ReadSize=miniBatchSize;
imdsTrainTransformed = transform(imdsTrain,@CutOutAug,'IncludeInfo',true);
I=read(imdsTrain);
I_transformed=read(imdsTrainTransformed);
C=cell(12,1);
idx=randperm(miniBatchSize,12);
C=cat(4,I_transformed{idx(1:12),1});
figure;montage(C)

reset(imdsTrainTransformed)

