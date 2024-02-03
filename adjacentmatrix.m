function [G] = adjacentmatrix(Node,edge,B)
%图论问题将其转化为临界矩阵
%第一个为节点的数量
%第二个为边的数量
%第三个为相邻边的信息
   G = inf(Node);
   for i = 1:Node
       for j = 1:Node
            if i==j
                G(i,j) = 1;
            end
            for k = 1:edge
                if str_to_num(B(k,1)) == i && str_to_num(B(k,2)) == j
                   G(i,j) = B(k,3);
                end                   
            end
      end
   end
end