function [ Pred_nb ] = nb_test( model,Xtest )
%Prediction Test set
Ntest=length(Xtest(:,1));
n=1;
score_E=zeros(Ntest,1); score_O=zeros(Ntest,1);

while n<Ntest+1
    score_E(n)=sum(log(model(1,2:length(model))).*Xtest(n,:))+log(model(1,1));
    score_O(n)=sum(log(model(2,2:length(model))).*Xtest(n,:))+log(model(2,1));
    n=n+1;
end

n=1;
comp=score_E-score_O;
Pred_nb=zeros(Ntest,1);

while n<Ntest+1
    if comp(n)>0
        Pred_nb(n)=1;
    else
        Pred_nb(n)=0;
    end
    n=n+1;
end


end

