clc
clear all;
close all;

% NEURAL NETWORK
load('trainingsdaten_nn.mat');

rng('default');
hiddenLayerSize = [4 5 11];
net = patternnet(hiddenLayerSize);

net.divideParam.trainRatio = 0.9;
net.divideParam.valRatio = 0.1;
net.divideParam.testRatio = 0.0;

[net, tr] = train(net, trainingInputs, trainingTargets);

load('testdaten_nn.mat');
y = net(testInputs);
performance = perform(net, testInputs, y);
accu_nn = computeAccuracy(testTargets, y);

% MAXIMUM-LIKELIHOOD, BAYES-CLASSIFIER
load('trainingsdaten.mat');

intakt = [xIntakt.temp; xIntakt.laut];
defekt = [xDefekt.temp; xDefekt.laut];

theta_intakt = gaussianEstimation(intakt);
theta_defekt = gaussianEstimation(defekt);

lik_intakt = likelihood(intakt,theta_intakt);
lik_defekt = likelihood(defekt,theta_defekt);

k(1).name = 'Okay';
k(1).theta = theta_intakt;
k(1).prior = 0.999;

k(2).name = 'Malfunction';
k(2).theta = theta_defekt;
k(2).prior = 1 - k(1).prior;

testdata = [testInputs(2,:); testInputs(1,:)];

% classify
class_ml = classifyML(testdata, k);
class_bayes = classifyBayes(testdata, k);
accu_ml = computeAccuracy(testTargets, class_ml);
accu_bayes = computeAccuracy(testTargets, class_bayes);
