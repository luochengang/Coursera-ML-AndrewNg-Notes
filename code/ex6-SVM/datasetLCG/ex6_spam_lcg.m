format long g
clear;
clc;
close;
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex6-SVM');
addpath('D:\github\Coursera-ML-AndrewNg-Notes\code\ex6-SVM\datasetLCG');
% 垃圾邮件语料库下载
% https://spamassassin.apache.org/old/publiccorpus/

spamPath = 'D:\github\Coursera-ML-AndrewNg-Notes\code\ex6-SVM\datasetLCG\spam';
% spamFiles 1896*38 其中1896代表文件个数
% spamFiles(1, :)代表第1个文件名的字符串
spamFiles = ls(spamPath);

frequencyMap = containers.Map();

% !!!
% size(spamFiles, 1)
for idx = 1:3
  file_name = [spamPath '\' spamFiles(idx, :)];
  file_contents = readFile(file_name);
  contents_vector  = getPreprocessedEmail(file_contents);
  disp(idx);
  for i = 1:length(contents_vector)
    if frequencyMap.isKey(contents_vector{i})
      frequencyMap(contents_vector{i}) += 1;
    else
      frequencyMap(contents_vector{i}) = 1;
    endif
  endfor
endfor

keyv = frequencyMap.keys;
wordV = cell(0, 1);
for i = 1:length(keyv)
  if frequencyMap(keyv{i}) >= 3
    wordV = [wordV ; keyv{i}];
  endif
endfor
sortedWordV = sort(wordV);

for i = 1:size(sortedWordV, 1)
  sortedWordV(i, :) = [i sortedWordV(i, :)];
endfor
disp(sortedWordV);
