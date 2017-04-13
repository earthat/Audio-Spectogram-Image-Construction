function newcdata=spectogramImg(cdata)
 
%% this funciton save the spectogram of the audio signal as inout image for
 % further image classification work
 %%
[r,c,l]=size(cdata);
% newcdata=cdata;
cnt2=1;cnt1=1;
for ii=1:l
    for kk=1:c
        C = unique(cdata(:,kk,ii)==255);
        cnt=hist(cdata(:,kk,ii)==255,C);
        if numel(cnt)==1 && cnt==r
            %                 newcdata(:,kk,:)=[];
            colm(ii,cnt2)=kk;cnt2=cnt2+1;   
        end
    end    
end
for ii=1:l
    for jj=1:r
        C = unique(cdata(jj,:,ii)==255);
        cnt=hist(cdata(jj,:,ii)==255,C);
        if numel(cnt)==1 && cnt==c
            %             newcdata(jj,:,:)=[];
            rows(ii,cnt1)=jj;cnt1=cnt1+1;
        end
    end
end
for ii=1:l
    %%% remove white colmuns in the saved spectogram image
    colns=nonzeros(colm(ii,:));
    whitecolms=ismember(1:c,colns);
    colmno=[1:c];
    nonwhitecolm=colmno(~whitecolms);
%     newcdata(:,:,ii)=cdata(:,nonwhitecolm,ii);
    
    %%% remove white rowss in the saved spectogram image
    nzrow=nonzeros(rows(ii,:));
    whiterows=ismember(1:r,nzrow);
    rowno=[1:r];
    nonwhiterow=rowno(~whiterows);
    newcdata(:,:,ii)=cdata(nonwhiterow,nonwhitecolm,ii);
end