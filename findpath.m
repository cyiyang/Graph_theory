function possible_paths = findpath(Graph,partialpath,destination,partialweight)
%此函数为图论寻找所有路径的函数
%第一个值为临界矩阵
%第二个为出发的地址
%第三个为目的地
%第四个是每条边的权值如果没有则为1，自己跟自己为0，没有临界关系则为inf
    pathlength =length(partialpath);
    lastnode = partialpath(pathlength);
    nextnodes = find(0<Graph(lastnode,:)&Graph(lastnode,:)<inf);

    Glength = length(Graph);
    possible_paths = [];
    
    if lastnode == destination        
        possible_paths = partialpath;
        possible_paths(Glength+1) = partialweight;
        return;
    elseif length(find(partialpath == destination)) ~= 0
        return;
    end

    for i = 1:length(nextnodes)
        if destination == nextnodes(i)
            tmppath = cat(2,partialpath,destination);
            tmppath(Glength + 1) = partialweight + Graph(lastnode,destination);
            possible_paths(length(possible_paths)+1,:) = tmppath;
            nextnodes(i) = 0;
        elseif length(find(partialpath == nextnodes(i))) ~= 0
            nextnodes(i) = 0;
        end       
    end    
    nextnodes = nextnodes(nextnodes ~= 0);

    for i = 1:length(nextnodes)
        tmppath = cat(2,partialpath,nextnodes(i));
        tmppsbpaths = findpath(Graph,tmppath,destination,partialweight+Graph(lastnode,nextnodes(i)));
        possible_paths = cat(1,possible_paths,tmppsbpaths);
    end
end