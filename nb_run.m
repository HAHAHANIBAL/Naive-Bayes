function nb_run(Xtrain, Ytrain, Xtest, Ytest)
%Main Function
model=[]; Pred_nb=[]; n=1;
a=0; b=0; c=0; d=0;
model=nb_train(Xtrain,Ytrain);
Pred_nb=nb_test(model, Xtest);
while n<length(Xtest(:,1))+1
    if Pred_nb(n)==1 && Ytest(n)==1
        d=d+1;
    elseif Pred_nb(n)==0 && Ytest(n)==0
        a=a+1;
    elseif Pred_nb(n)==1 && Ytest(n)==0
        b=b+1;
    else
        c=c+1;
    end
    n=n+1;
end

accuracy = (a+d)/(a+b+c+d);
precision = d/(b+d);
recall = d/(c+d);

save Pred_nb.mat Pred_nb;
fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);


end

