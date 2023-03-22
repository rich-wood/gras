function s = scalcer(p,n,r,v,dim1,dim2) %#eml
% #ras
%Calculate the scaling factor on columns
%p is positive matrix
%n is negative matrix
%s is scalar
%dim1 is no of rows of p/n
%dim2 is no of cols of p/n

s=ones(dim1,1);

for j=1:dim1
    pscale = pcalcer(p,r,j,dim2);
    nscale = ncalcer(n,r,j,dim2);
    if pscale==0
        if nscale==0
            s(j) = 1;
        else
            s(j) = (v(j) + sqrt((v(j))^2+4*nscale))/(2);
        end
    else
        s(j) = (v(j) + sqrt((v(j))^2+4*pscale*nscale))/(2*pscale);
%       s(j) = (exp(1)*v(j) + sqrt((exp(1)*v(j))^2+4*pscale*nscale))/(2*pscale);
    end
end
    
    
    
    
function pofr = pcalcer(p,r,j,dim2)

pofr = 0;
for i =1:dim2
    if i>size(r,1)
        pofr = pofr +p(i,j);
    else
        pofr = pofr + p(i,j)*r(i);
    end 
end


function nofr = ncalcer(n,r,j,dim2)

nofr = 0;
for i =1:dim2
    %     if r(i) ~=0
    if i>size(r,1)
        nofr = nofr+n(i,j);
    else
        nofr = nofr + n(i,j)/(r(i)+1e-10);
    end
    %     end
end