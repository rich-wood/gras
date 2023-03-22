function r = rcalcer(p,n,s,u,dim1,dim2) %#eml
% #ras
%Calculate the scaling factor on rows
%p is positive matrix
%n is negative matrix
%s is scalar
%dim1 is no of rows of p/n
%dim2 is no of cols of p/n

r=ones(dim1,1);

for i=1:dim1
    pscale = pcalcer(p,s,i,dim2);
    nscale = ncalcer(n,s,i,dim2);
    if pscale==0
        if nscale==0
            r(i) = 1;
        else
            r(i) = (u(i) + sqrt((u(i))^2+4*nscale))/(2);
        end
    else
        r(i) = (u(i) + sqrt((u(i))^2+4*pscale*nscale))/(2*pscale);
%       r(i) = (exp(1)*u(i) + sqrt((exp(1)*u(i))^2+4*pscale*nscale))/(2*pscale);
    end
end
    
    
    
    
function pofr = pcalcer(p,s,i,dim2)

pofr = 0;
for j =1:dim2
    if j>size(s,2)
        pofr = pofr +p(i,j);
    else
        pofr = pofr + p(i,j)*s(j);
    end 
end


function nofr = ncalcer(n,s,i,dim2)

nofr = 0;
for j =1:dim2
    %     if s(j) ~=0
    if j>size(s,2)
        nofr = nofr+n(i,j);
    else
        nofr = nofr + n(i,j)/(s(j)+1e-10);
    end 
    %     end
end