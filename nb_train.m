function [ model ] = nb_train( Xtrain, Ytrain )
%Naive Bayes Model
%Train Data
PriorE=sum(Ytrain==1)/length(Ytrain);
PriorO=sum(Ytrain==0)/length(Ytrain);
CombineTrain = cat (2, Ytrain, Xtrain);
count=1; n=1;
c1=zeros(1,length(Xtrain));
c2=zeros(1,length(Xtrain));

logicE=(CombineTrain(:,1)==1);
logicO=(CombineTrain(:,1)==0);
c1=logicE'*Xtrain;
c2=logicO'*Xtrain;

CondProbE = zeros(1,length(Xtrain));
CondProbO = zeros(1,length(Xtrain));


CondProbE =(c1(1:length(Xtrain(1,:)))+1)/(length(Xtrain)+sum(c1));
CondProbO =(c2(1:length(Xtrain(1,:)))+1)/(length(Xtrain)+sum(c2));

model = [PriorE, CondProbE; PriorO, CondProbO];

end

